Graude.ParticipationsRoute = Ember.Route.extend
  model: ()->
    @modelFor( 'tournament' ).get( 'participations' )

Graude.ParticipationRoute = Ember.Route.extend
  actions:
    new: () ->
      controller = @controllerFor( 'comment.new' )
      comment = @store.createRecord( 'comment' )
      comment.set( 'body', controller.get( 'body' ) )
      comment.set( 'army_list', @currentModel.get( 'army_list' ) )
      comment.save().then(
        (model) ->
          controller.set( 'body', '' )
      )


