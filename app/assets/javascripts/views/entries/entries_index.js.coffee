class MessageBoard.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  events:
    'submit #new_entry': 'createEntry'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendEntry, this)

  render: ->
    $(@el).html(@template(entries: @collection))
    @collection.each(@appendEntry)
    this

  appendEntry: (entry) ->
    view = new MessageBoard.Views.Entry(model: entry)
    $('#entries').append(view.render().el)

  createEntry: (event) ->
    event.preventDefault()
    attributes = message: $('#new_entry_message').val()
    @collection.create attributes,
      wait: true
      success: -> $('#new_entry')[0].reset()
      error: @handleError

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

