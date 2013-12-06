  handles = []

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
        feature.layer.drawFeature(handle, "invisible")

  onFeatureDrag = (feature,pixel) ->
    if !feature.attributes.is_handle
      for handle in handles[feature.id]
        handle.layer.drawFeature(handle, "handle")
    else
      x_mirror = feature.attributes.x_mirror
      y_mirror = feature.attributes.y_mirror
      x_mirror.geometry.x = feature.geometry.x
      y_mirror.geometry.y = feature.geometry.y
      feature.layer.drawFeature(feature.layer.getFeatureById(feature.attributes.parent_id),"default")
  onFeatureDragComplete = (feature,pixel) ->
    if feature.attributes.remote_id
      update_feature(feature)
    else if feature.attributes.is_handle
      update_feature(feature.layer.getFeatureById(feature.attributes.parent_id))

  onFeatureAdded = (feature) ->
    feature.attributes.user_added = 1
    add_feature(feature)
  onClick = (evt) ->
    msg = "click " + evt.xy
    console.log(msg)
  onDblclick = (evt) ->
    msg = "dblclick " + evt.xy
    console.log(msg)

  add_handles = (feature) ->
    bounds = feature.geometry.getVertices()
    handles[feature.id] = [
      new OpenLayers.Feature.Vector(bounds[0], { type: "square" })
      new OpenLayers.Feature.Vector(bounds[1], { type: "square" })
      new OpenLayers.Feature.Vector(bounds[2], { type: "square" })
      new OpenLayers.Feature.Vector(bounds[3], { type: "square" })
      ]
    feature.layer.addFeatures(handles[feature.id])
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

  update_feature = (feature) ->
    mystr = window.geojson.write(feature,true)
    $.ajax
      url: "/geometries/" + feature.attributes.remote_id + ".json"
      type: "PATCH"
      contentType: "application/json"
      data: JSON.stringify({"geometry": {"geometry": mystr}})
      success: (data,textStatus) ->
        alert(textStatus) if textStatus != "nocontent"

  add_feature = (feature) ->
    mystr = window.geojson.write(feature,true)
    $.post "/geometries.json",
      {
        "geometry":
          "geometry": mystr
      }
      (data,textStatus) ->
        feature.attributes.remote_id  = data.id


  window.map_edit_init = ->
    polyOptions =
      sides: 4
      snapToggle: "altKey"
      irregular: true
      keyMask: OpenLayers.Handler.MOD_SHIFT

    window.draw_control = new OpenLayers.Control.DrawFeature(
      window.polygon_layer,
      OpenLayers.Handler.RegularPolygon,
        handlerOptions: polyOptions
        featureAdded: onFeatureAdded
    )

    window.map.addControl(window.draw_control)
    window.draw_control.activate()

    dragFeature = new OpenLayers.Control.DragFeature(window.polygon_layer,
      onDrag: onFeatureDrag
      onComplete: onFeatureDragComplete
      )
    window.map.addControl(dragFeature)
    dragFeature.activate()

    selectControl =
      new OpenLayers.Control.SelectFeature(window.polygon_layer,
        hover: true
        onSelect: onFeatureSelect
        onUnselect: onFeatureUnselect
      )
    window.map.addControl(selectControl)
    selectControl.activate()

    snap = new OpenLayers.Control.Snapping(
      layer: window.polygon_layer
      targets: [window.polygon_layer]
      greedy: false
      )
    snap.activate()