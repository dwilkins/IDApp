# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  L_DISABLE_3D = true;

  L.Projection.Identity =
    project: (latlng) =>
      return new L.Point latlng.lat, latlng.lng
    unproject: (point) =>
      if(isNaN(point.y))
        point.y = 0
      if(isNaN(point.x))
        point.x = 0
      return new L.LatLng point.x, point.y

  `
   L.CRS.Cartesian = L.Class.extend({
        includes: L.CRS,
        initialize: function (e, c) {
            L.Util.setOptions(this, c), this.unbounded = !0, this._bounds = e;
            var xsize = e.max.x - e.min.x,
                ysize = e.max.y - e.min.y,
                n = this.options.falseEasting || 0,
                i = 0 + n / (xsize),
                s = this.options.falseNorthing || 0,
                l = 1 - s / (ysize);
                l = 1 - (s / (ysize));
                this.projection = L.Projection.Identity;
                this.transformation = new L.Transformation(1 / xsize, i, -1 / ysize, l)
                this.transformation = new L.Transformation(1 / xsize, 0, -.625 / (ysize), .625)
        }
    })
  `

  window.map_init = ->
    sc =
      upperLeft:
        x: 8192
        y: 0
      lowerRight:
        x: 0
        y: 8192
      offset:
        x: 0
        y: 0
      center:
        x: 25
        y: 15


    coords = new L.Bounds(new L.Point(sc.upperLeft.x, sc.upperLeft.y, !1), new L.Point(sc.lowerRight.x, sc.lowerRight.y, !1))
    cart_crs =  new L.CRS.Cartesian(coords, { falseEasting: sc.offset.x, falseNorthing: sc.offset.y})

    map_options =
      zoom: 1
      minZoom: 1
      maxZoom: 5
      dragging: true
      center: [4096,4096]
      crs: cart_crs

    layer_options =
      zoom: 1
      minZoom: 1
      maxZoom: 5
      noWrap: true
      continuousWorld: false
      zoomReverse: false


    window.map = L.map "map", map_options

    attrib = L.control.attribution({
        position: 'bottomleft',
        prefix: window.navbar_html
        }).addTo(window.map)

    attrib = L.control.attribution({
        position: 'topright',
        prefix: window.logo_html
        }).addTo(window.map)


    tile_layer = new L.TileLayer '/assets/map-tiles/{z}/map_{x}_{y}.png',layer_options
    tile_layer.addTo(window.map)
    window.map.setView [4096,4096],1
    # L.control.layers({"Tile Layer": tile_layer}).addTo(window.map)


  jQuery ->
    jQuery.get '/maps/navbar', (data)->
      window.navbar_html = data
      jQuery.get '/maps/logo', (data)->
        window.logo_html = data
        window.map_init()

