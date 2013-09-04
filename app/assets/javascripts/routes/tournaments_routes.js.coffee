Graude.TournamentsRoute = Ember.Route.extend
  model: () ->
    Graude.Tournament.find({})

Graude.TournamentRoute = Ember.Route.extend
  model: ( params ) ->
    Graude.Tournament.find( params.tournament_id )
