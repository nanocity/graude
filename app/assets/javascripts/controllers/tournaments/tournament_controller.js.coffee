Graude.TournamentController = Ember.ObjectController.extend
  currentPlayers: ( () ->
    return "#{@get('participations').get('length')}/#{@get('players_limit')}"
  ).property('players_limit', 'participations')
