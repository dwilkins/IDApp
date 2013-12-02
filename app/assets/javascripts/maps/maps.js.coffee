# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  handle_styles = new OpenLayers.StyleMap(
    "default":
      graphicName: "${type}"
      pointRadius: 10
      strokeColor: "fuchsia"
      strokeWidth: 2
      fillColor: "lime"
      fillOpacity: 0.2
      strokeDashstyle: "solid"
    "handle":
      graphicName: "${type}"
      pointRadius: 10
      strokeColor: "black"
      strokeDashstyle: "dot"
      strokeWidth: 2
      fillColor: "white"
      fillOpacity: 0.2
    "invisible":
      display: "none"
    "select":
      strokeDashstyle: "dot"
      fillOpacity: 0.5
    )

  id_rooms= new OpenLayers.Layer.XYZ("InnovationDepot","/assets/map-tiles/${z}/map_${x}_${y}.png",
    isBaseLayer: true
    numZoomLevels: 6
    maxExtent: new OpenLayers.Bounds(0,0,8192,8192)
    maxResolution:8192 / 256,
    numZoomLevels: 6
    projection: 'longlat'
    )

  polygon_layer = new OpenLayers.Layer.Vector("Polygon Layer"
    styleMap: handle_styles
    attribution: window.logo_html
    )

  transient_features = []

  handles = []

  geojson = new OpenLayers.Format.GeoJSON()

  onFeatureSelect = (feature) ->
    if feature.attributes.user_added == undefined
      return
    if handles[feature.id] == undefined
      add_handles(feature)
    window.draw_control.deactivate()
    for handle in handles[feature.id]
      handle.layer.drawFeature(handle, "handle")
  onFeatureUnselect = (feature) ->
    if feature.attributes.user_added == undefined
      if feature.attributes.is_handle == 1
        feature_parent_id = feature.attributes.parent_id
        for handle in handles[feature_parent_id]
          handle.layer.drawFeature(handle, "invisible")
    else
      add_handles(feature) if handles[feature.id] == undefined
      window.draw_control.activate()
      for handle in handles[feature.id]
        polygon_layer.drawFeature(handle, "invisible")

  onFeatureDrag = (feature,pixel) ->
    if !feature.attributes.is_handle
      for handle in handles[feature.id]
        handle.layer.drawFeature(handle, "handle")
    else
      x_mirror = feature.attributes.x_mirror
      y_mirror = feature.attributes.y_mirror
      x_mirror.geometry.x = feature.geometry.x
      y_mirror.geometry.y = feature.geometry.y
      feature.layer.drawFeature(polygon_layer.getFeatureById(feature.attributes.parent_id),"default")
  onFeatureDragComplete = (feature,pixel) ->
    serialize()

  onFeatureAdded = (feature) ->
    feature.attributes.user_added = 1
    feature.attributes.id = feature.id
  onClick = (evt) ->
    msg = "click " + evt.xy
    console.log(msg)
  onDblclick = (evt) ->
    msg = "dblclick " + evt.xy
    serialize()
    console.log(msg)

  add_handles = (feature) ->
    bounds = feature.geometry.getVertices()
    handles[feature.id] = [
      new OpenLayers.Feature.Vector(bounds[0], { type: "square" })
      new OpenLayers.Feature.Vector(bounds[1], { type: "square" })
      new OpenLayers.Feature.Vector(bounds[2], { type: "square" })
      new OpenLayers.Feature.Vector(bounds[3], { type: "square" })
      ]
    polygon_layer.addFeatures(handles[feature.id])
    new_handles = handles[feature.id]
    new_handles[0].attributes.x_mirror = new_handles[1]
    new_handles[1].attributes.x_mirror = new_handles[0]
    new_handles[2].attributes.x_mirror = new_handles[3]
    new_handles[3].attributes.x_mirror = new_handles[2]

    new_handles[0].attributes.y_mirror = new_handles[3]
    new_handles[1].attributes.y_mirror = new_handles[2]
    new_handles[2].attributes.y_mirror = new_handles[1]
    new_handles[3].attributes.y_mirror = new_handles[0]
    for handle in handles[feature.id]
      handle.attributes.is_handle = 1
      handle.attributes.parent_id = feature.id
      handle.layer.drawFeature(handle, "invisible")
  serialize = ->
    for feature in polygon_layer.features
      if feature.attributes.user_added
        mystr = geojson.write(feature,true)
        console.log("GeoJSON String: ")
        console.log(mystr)


  window.map_init = ->
    map = new OpenLayers.Map(
      div: "map",
      displayProjection: 'longlat'
      projection: 'longlat'
      numZoomLevels: 6
      controls:[
        new OpenLayers.Control.MousePosition()
        new OpenLayers.Control.Navigation()
        new OpenLayers.Control.PanZoomBar()
        new OpenLayers.Control.LayerSwitcher()
        new OpenLayers.Control.Attribution(" | ", "${layers}" )
      ]
    )



    polyOptions =
      sides: 4
      snapToggle: "altKey"
      irregular: true
      keyMask: OpenLayers.Handler.MOD_SHIFT

    window.draw_control = new OpenLayers.Control.DrawFeature(
      polygon_layer,
      OpenLayers.Handler.RegularPolygon,
        handlerOptions: polyOptions
        featureAdded: onFeatureAdded
    )

    map.addControl(window.draw_control)
    window.draw_control.activate()

    dragFeature = new OpenLayers.Control.DragFeature(polygon_layer,
      onDrag: onFeatureDrag
      onComplete: onFeatureDragComplete
      )
    map.addControl(dragFeature)
    dragFeature.activate()

    selectControl =
      new OpenLayers.Control.SelectFeature(polygon_layer,
        hover: true
        onSelect: onFeatureSelect
        onUnselect: onFeatureUnselect
      )
    map.addControl(selectControl)
    selectControl.activate()

    snap = new OpenLayers.Control.Snapping(
      layer: polygon_layer
      targets: [polygon_layer]
      greedy: false
      )
    snap.activate()

    map.addLayers([id_rooms,polygon_layer])
    map.setCenter(new OpenLayers.LonLat(4096, 4096), 2)
    map.zoomToMaxExtent()

  jQuery ->
    jQuery.get '/maps/navbar', (data)->
      window.navbar_html = data
      id_rooms.attribution = data
      jQuery.get '/maps/logo', (data)->
        window.logo_html = data
        polygon_layer.attribution = data
        window.map_init()
