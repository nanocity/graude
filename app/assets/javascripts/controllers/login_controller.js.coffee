Graude.LoginController = Ember.Controller.extend
  isLoggedIn: ( () ->
    return @get('session.email' ) and @get( 'session.id' )
  ).property( 'session.email', 'session.id' )

  tournaments: ( () ->
    return @get('session.tournaments' )
  ).property( 'session.tournaments' )

