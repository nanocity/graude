Graude.PlayersIndexRoute = Ember.Route.extend
  model: ()->
    return @store.findAll( 'player' )
