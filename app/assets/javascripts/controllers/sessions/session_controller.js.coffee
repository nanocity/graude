Graude.SessionController = Ember.ObjectController.extend
  isLoggedIn: ( () ->
    return !!@get('content.email' )
  ).property( 'content.email' )
