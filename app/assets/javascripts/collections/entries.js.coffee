class MessageBoard.Collections.Entries extends Backbone.Collection
  url: '/api/entries'

  model: MessageBoard.Models.Entry
