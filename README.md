NewHeights jQuery Plugin
======

jQuery plugin, for responsive pages, to set tags to same height.  Happens during/after browser resize.

Usage:
------
    $(selector).newHeights(refresh = 500)

    selector = any jQuery selector or elements you want to be the same height

    refresh = number (ms) for timer to continually resize - looks better
            OR 'resize' only after browser resize
            OR 'once' to resize only once

What it does:
------

    1) Selects set of all elements that match `selector`
    2) Calculates max_height of all elements in set
    3) Sets height of all elements in set to max_height
    4) Refreshes based on `refresh` parameter.

Example syntax:
------

Coffeescript:

    # Set all h3's in list to same height.  Refresh every 500ms
    $('#home .fancyBoxes .list .item h3').newHeights()

Javascript:

    // Set all .preface tags in list to same height on browser resize
    $('#home .fancyBoxes .list .item .preface').newHeights('resize')

See below or [example.html](http://htmlpreview.github.io/?https://github.com/MichaelJCole/newheights/blob/master/example.html) for examples.

