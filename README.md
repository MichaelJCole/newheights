newheights
==========

jQuery plugin to set tags to same height in responsive design.

Usage:

$(selector).newHeights(refresh = 500)

  selector = any jQuery selector

  refresh = number (ms) for timer to continually resize - looks better
            OR 'onResize' only after browser resize - less CPU
            OR 'once' to resize only once - or any other string

This:
  1) Selects set of all elements that match `selector`
  2) Calculates max_height of all elements in set
  3) Sets height of all elements in set to max_height
  4) Refreshes based on `refresh` parameter.

Coffeescript:
  # Set all h3's in list to same height.  Refresh every 500ms
  $('#home .fancyBoxes .list .item h3').newHeights()

Javascript:
  // Set all .preface tags in list to same height on browser resize
  $('#home .fancyBoxes .list .item .preface', 'onResize').newHeights('onResize')

See example.html for examples.
