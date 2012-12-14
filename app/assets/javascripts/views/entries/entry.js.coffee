class MessageBoard.Views.Entry extends Backbone.View
  events: ->
    'click #delete' : 'deleteEntry'
    'click #edit' : 'editEntry'
    'click #update' : 'updateEntry'

  template: JST['entries/entry']
  tagName: 'li'
  render: ->
    $(@el).html(@template(entry: @model))
    this

  deleteEntry: (event) ->
    event.preventDefault()
    id = @model.get('id')
    @model.destroy id,
    wait: true
    @collection = new MessageBoard.Collections.Entries()
    @collection.fetch()
    view = new MessageBoard.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.render().el)

  editEntry: (event) ->
    event.preventDefault()
    $(@el).html(window.JST['entries/_edit']({ entry: @model}))

  updateEntry: (event) ->
    event.preventDefault()
    value = $(@el).find("#edit_entry_message").val()
    @model.save {
      id: @model.get('id'),
      message: value
    }
    $(@el).html(@template(entry: @model))


