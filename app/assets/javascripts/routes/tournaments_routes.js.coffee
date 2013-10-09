Graude.TournamentsIndexRoute = Graude.AuthenticatedRoute.extend
  model: () ->
    return @store.findAll( 'tournament' )

Graude.TournamentsNewRoute = Graude.AuthenticatedRoute.extend()
