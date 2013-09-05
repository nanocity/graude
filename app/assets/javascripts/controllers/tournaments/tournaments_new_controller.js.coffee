Graude.TournamentsNewController = Ember.ObjectController.extend
  actions:
    createTournament: ( params ) ->
      @content.save()
