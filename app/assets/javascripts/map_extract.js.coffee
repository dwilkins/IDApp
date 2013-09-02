# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('document').ready ->
  extract_map_data = ->
    svg_element = document.getElementById('svg-map');
    svg_doc = svg_element.getSVGDocument();
    our_layer = svg_doc.getElementById('rooms')
    console.log child.getBBOX(),  child in our_layer.children
  this_svg = document.getElementById 'svg-map'
  this_svg.addEventListener 'load', (e) ->
    extract_map_data()


