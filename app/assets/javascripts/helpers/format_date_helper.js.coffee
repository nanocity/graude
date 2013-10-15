Ember.Handlebars.registerBoundHelper( 'formatDate', (date, format) ->
  moment( date ).format( format )
)
