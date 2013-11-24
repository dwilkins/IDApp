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

  polygon_layer = new OpenLayers.Layer.Vector("Polygon Layer",
    {styleMap: handle_styles});

  transient_features = []

  onFeatureSelect = (feature) ->
    if feature.attributes.handles == undefined
      return
    bounds = feature.geometry.getVertices()
    window.draw_control.deactivate()
    for handle in feature.attributes.handles
      handle.layer.drawFeature(handle, "handle")
  onFeatureUnselect = (feature) ->
    if feature.attributes.handles == undefined
      if feature.attributes.is_handle != undefined
        for handle in feature.attributes.parent.attributes.handles
          handle.layer.drawFeature(handle, "invisible")
      return
    window.draw_control.activate()
    for handle in feature.attributes.handles
      handle.layer.drawFeature(handle, "invisible")

  onFeatureDrag = (feature,pixel) ->
    if feature.attributes.is_handle == undefined
      for handle in feature.attributes.handles
        handle.layer.drawFeature(handle, "handle")
      return
    centroid = feature.geometry.getCentroid()
    feature.layer.drawFeature(feature.attributes.parent,"default")
  onFeatureAdded = (feature) ->
    bounds = feature.geometry.getVertices()
    feature.attributes.user_added = 1
    feature.attributes.handles = [
      new OpenLayers.Feature.Vector(bounds[0], { type: "square",})
      new OpenLayers.Feature.Vector(bounds[1], { type: "square" })
      new OpenLayers.Feature.Vector(bounds[2], { type: "square" })
      new OpenLayers.Feature.Vector(bounds[3], { type: "square" })
      ]
    polygon_layer.addFeatures(feature.attributes.handles)
    for handle in feature.attributes.handles
      handle.attributes.is_handle = 1
      handle.attributes.parent = feature
      handle.layer.drawFeature(handle, "invisible")
  onClick = (evt) ->
    msg = "click " + evt.xy
    console.log(msg)
  onDblclick = (evt) ->
    msg = "dblclick " + evt.xy
    console.log(msg)
  window.map_init = ->
    map = new OpenLayers.Map(
      div: "map",
      displayProjection: 'longlat',
      projection: 'longlat',
      numZoomLevels: 6,
      controls:[
        new OpenLayers.Control.MousePosition(),
        new OpenLayers.Control.Navigation(),
        new OpenLayers.Control.PanZoomBar(),
        new OpenLayers.Control.LayerSwitcher(),
        new OpenLayers.Control.Attribution()
      ],
    )

    OpenLayers.Control.Click = OpenLayers.Class(OpenLayers.Control,
      defaultHandlerOptions:
        {
          'single': true
          'double': false
          'pixelTolerance': 0
          'stopSingle': false
          'stopDouble': false
        }
      initialize:(options) ->
        this.handlerOptions = OpenLayers.Util.extend({}, this.defaultHandlerOptions)
        OpenLayers.Control.prototype.initialize.apply(this, arguments )
        this.handler = new OpenLayers.Handler.Click(
          this,
            {
              'click': this.onClick
              'dblclick': this.onDblclick
            }
          this.handlerOptions
          )
      onClick: (evt) =>
        msg = "click " + evt.xy
        console.log(msg)
      onDblclick: (evt) =>
        msg = "dblclick " + evt.xy
        console.log(msg)
    )
    id_rooms= new OpenLayers.Layer.XYZ("InnovationDepot","/assets/map-tiles/${z}/map_${x}_${y}.png",
      {
        isBaseLayer: true
        numZoomLevels: 6
        maxExtent: new OpenLayers.Bounds(0,0,8192,8192)
        maxResolution:8192 / 256,
        numZoomLevels: 6
        projection: 'longlat'
      }
    )


#    svg_layer = new OpenLayers.Layer.ScalableInlineXhtml(
#      "SVG Layer",
#      '/assets/InnovationDepotSecondFloorRooms.svg',
#      new OpenLayers.Bounds(0,0,8192,8192),
#      null
#      {
#        visibility:  false
#        isBaseLayer: false
#        numZoomLevels: 6
#        projection: 'longlat'
#      }
#    )

    click_hander = new OpenLayers.Handler.Click(null,{single: onClick, double: onDblclick }, {map: map})

    polyOptions = {sides: 4, snapToggle: "altKey", irregular: true, keyMask: OpenLayers.Handler.MOD_SHIFT };
    window.draw_control = new OpenLayers.Control.DrawFeature(
      polygon_layer,
      OpenLayers.Handler.RegularPolygon,
        handlerOptions: polyOptions
        featureAdded: onFeatureAdded
    )

    map.addControl(window.draw_control);
    window.draw_control.activate();

    dragFeature = new OpenLayers.Control.DragFeature(polygon_layer,
      onDrag: onFeatureDrag
      )
    map.addControl(dragFeature);
    dragFeature.activate()

    selectControl =
      new OpenLayers.Control.SelectFeature(polygon_layer,
        hover: true
        onSelect: onFeatureSelect
        onUnselect: onFeatureUnselect
      )
    map.addControl(selectControl)
    selectControl.activate()

#    modifyControl = new OpenLayers.Control.ModifyFeature(polygon_layer)
#    modifyControl.mode = OpenLayers.Control.ModifyFeature.RESIZE | OpenLayers.Control.ModifyFeature.DRAG
#    map.addControl(modifyControl)
#    modifyControl.activate()
#    controls ={ "single": new OpenLayers.Control.Click( {handlerOptions: "single": true } ) }
#    map.addControl(controls["single"])
    map.addLayers([id_rooms,polygon_layer])
    map.setCenter(new OpenLayers.LonLat(4096, 4096), 2)
#    map.setCenter(new OpenLayers.LonLat(4096, 4096), 2)
    map.zoomToMaxExtent()

  jQuery ->
    jQuery.get '/maps/navbar', (data)->
      window.navbar_html = data
      jQuery.get '/maps/logo', (data)->
        window.logo_html = data
        window.map_init()
