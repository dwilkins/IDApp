  jQuery ->
    jQuery.get '/maps/navbar', (data)->
      bl = new window.BaseLayer()
      bl.base_layer.attribution = data
      jQuery.get '/maps/logo', (data)->
        bl.polygon_layer.attribution = data
        bl.createMap()
