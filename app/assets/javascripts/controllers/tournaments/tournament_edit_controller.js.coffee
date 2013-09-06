Graude.TournamentEditController = Ember.ObjectController.extend
  actions:
    edit: (params) ->
      @content.save()
