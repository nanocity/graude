Graude.ApplicationRoute = Ember.Route.extend
  actions:
    destroySession: () ->
      controller = @controllerFor( 'session' )
      id = controller.currentSession.get( 'id' )
      controller.currentSession.setProperties( email: undefined )

      @store.find( 'session', id ).then ( session ) ->
        session.deleteRecord()
        controller.store.commit()
