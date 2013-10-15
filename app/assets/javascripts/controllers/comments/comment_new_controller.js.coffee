Graude.CommentNewController = Ember.ObjectController.extend
  init: () ->
    @set( 'content', {} )

  currentAvatar: ( ()->
    @currentSession.get( 'session.avatar' )
  ).property( 'currentSession' )
