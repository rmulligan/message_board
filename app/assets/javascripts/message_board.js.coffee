window.MessageBoard =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new MessageBoard.Routers.Entries()
    Backbone.history.start(pushState: true)

$(document).ready ->
  MessageBoard.initialize()
