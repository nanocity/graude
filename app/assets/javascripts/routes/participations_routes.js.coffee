Graude.ParticipationsRoute = Ember.Route.extend
  model: ()->
    @modelFor( 'tournament' ).get( 'participations' )

Graude.ParticipationRoute = Ember.Route.extend
  actions:
    commentNew: () ->
      controller = @controllerFor( 'comment.new' )
      if controller.currentSession.get( 'isLoggedIn' )
        comment = @store.createRecord( 'comment' )
        comment.setProperties(
          'body', controller.get( 'body' )
          'army_list', @currentModel.get( 'army_list' )
        )

        comment.save().then(
          ( model ) ->
            controller.set( 'body', '' )
        )

    armyListUpdate: () ->
      controller = @controllerFor( 'participation' )
      participation = @currentModel

      if controller.currentSession.get( 'isLoggedIn' )
        participation.get( 'army_list' ).save()
