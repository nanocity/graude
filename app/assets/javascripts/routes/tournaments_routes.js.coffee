Graude.TournamentsIndexRoute = Ember.Route.extend
  model: () ->
    return @store.findAll( 'tournament' )

Graude.TournamentsNewRoute = Ember.Route.extend
  model: () ->
    return @store.createRecord( 'tournament' )

Graude.TournamentIndexRoute = Ember.Route.extend
  model: () ->
    this.modelFor( 'tournament' )

Graude.TournamentEditRoute = Ember.Route.extend
  model: () ->
    this.modelFor( 'tournament' )
