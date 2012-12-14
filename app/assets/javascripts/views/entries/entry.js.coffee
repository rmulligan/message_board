class MessageBoard.Views.Entry extends Backbone.View

  events: ->
    'click': 'showEntry'
  template: JST['entries/entry']
  tagName: 'li'
  render: ->
    $(@el).html(@template(entry: @model))
    this

  showEntry: ->
    Backbone.history.navigate("entries/#{@model.get('id')}",true)

