Graude.TournamentEditController = Ember.ObjectController.extend
  actions:
    editTournament: (params) ->
      @content.save()
