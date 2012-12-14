class MessageBoard.Routers.Entries extends Backbone.Router
  routes:
    '': 'index'
    'entries/:id': 'show'

  initialize: ->
    @collection = new MessageBoard.Collections.Entries()
    @collection.fetch()

  index: ->
    view = new MessageBoard.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Entry #{id}"
