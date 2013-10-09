Graude.CreatedTournamentsController = Ember.ArrayController.extend
  tournaments_count: ( () ->
    return @get('length')
  ).property( '@each.length' )
