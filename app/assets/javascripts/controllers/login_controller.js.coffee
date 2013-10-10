Graude.LoginController = Ember.Controller.extend
  isLoggedIn: ( () ->
    return @get('session.email' ) and @get( 'session.id' )
  ).property( 'session.email', 'session.id' )

  created_tournaments: ( () ->
    return @get('session.created_tournaments' )
  ).property( 'session.created_tournaments' )

  participating_tournaments: ( () ->
    return @get('session.participating_tournaments' )
  ).property( 'session.participating_tournaments' )
