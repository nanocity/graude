Graude.TournamentsIndexRoute = Ember.Route.extend
  model: () ->
    return @store.findAll( 'tournament' )
