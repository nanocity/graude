Graude.PlayersRoute = Ember.Route.extend
  model: () ->
    return @store.findAll( 'player' )
