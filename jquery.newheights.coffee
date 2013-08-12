###
newheights.coffee v0.1
https://github.com/MichaelJCole/newheights

The MIT License (MIT)

Copyright (c) 2013 Michael Cole

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###

# newheights jQuery Plugin
(($, window) ->
  $.extend $.fn, newHeights: (refresh = 500) ->

      selector = this

      # Function to set heights
      _setMaxHeight = (selector) ->
        newMaxHeight = 0  # max height of all elements

        # need 2+ elements
        if $(selector).length < 2
          console.log selector + ": newHeights selector has less than 2 elements - quitting"
          # this can happen when 0 elements exist
          return

        # Reset heights to default - so we have something to recalculate
        $(selector).height "auto"

        # Calculate newMaxHeight
        $(selector).each (index, element) ->
          #console.log $(element).height()
          newMaxHeight = Math.max $(element).height(), newMaxHeight

        # Set new heights
        $(selector).height newMaxHeight


      # Declare functions to manage window resizing.

      # Method1: Continually _setMaxHeight every refresh msec
      timer = null   # used to prevent height setting during resizing
      _loopMaxHeight = (selector, refresh, oldwidth) ->

        # only resize if document has changed siz
        width = $(document).width()
        if (width != oldwidth)
          _setMaxHeight(selector)

        timer = setTimeout ( -> _loopMaxHeight selector, refresh, width), refresh

      # Method2: Wait 100ms, then do one _setMaxHeight.  Clear the timer so happens once after browser resize complete
      _oneMaxHeight = (selector) ->
        clearTimeout timer
        timer = setTimeout (-> _setMaxHeight selector), 100


      # HERE is the code entry point.
      # Ok, now do the right thing based on parameters
      
      _setMaxHeight selector

      if typeof refresh is "number"
        # Method1: resize every refresh ms - this looks better.
        _loopMaxHeight selector, refresh

      else if refresh == 'resize'
        # Method2: on window resize, reset timer.  Resize happens 100ms after resize complete
        $(window).resize ( ->
          _oneMaxHeight selector
        )
      # else resized once above, do nothing

      @ # allow chaining
) this.jQuery or this.Zepto, this
