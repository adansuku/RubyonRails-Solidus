add_image_handlers = ->
  ($ 'ul.thumbnails li').eq(0).addClass 'selected'
  ($ 'ul.thumbnails a').on 'click', (event) ->
    ($ this).mouseout ->
      ($ 'ul.thumbnails li').removeClass 'selected'
      ($ event.currentTarget).parent('li').addClass 'selected'
    false
$ ->
  add_image_handlers()
  