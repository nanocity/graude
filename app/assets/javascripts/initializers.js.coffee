Ember.Application.initializer
  name: 'login'

  initialize: ( container, application ) ->
    container.register( 'login:main', Graude.LoginController )
    application.inject( 'controller', 'currentSession', 'login:main' )

    store = container.lookup( 'store:main' )
    controller = container.lookup( 'controller:login' )

    store.findAll( 'session' ).then( ( sessions ) ->
      if session = sessions.objectAt(0)
        controller.currentSession.set( 'session', session );
    )
