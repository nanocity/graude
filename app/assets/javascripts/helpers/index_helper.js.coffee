Ember.Handlebars.registerBoundHelper( 'indexHelper', (options) ->
  options.data.view.templateData.view.contentIndex + 1
)
