Graude.TournamentsNewController = Ember.ObjectController.extend
  actions:
    create: ( params ) ->
      @content.save()
