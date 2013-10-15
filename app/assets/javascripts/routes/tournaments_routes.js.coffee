Graude.TournamentsIndexRoute = Graude.AuthenticatedRoute.extend
  model: () ->
    @store.findAll( 'tournament' )

Graude.TournamentsNewRoute = Graude.AuthenticatedRoute.extend
  model: () ->
    @store.createRecord( 'tournament' )

  actions:
    save: () ->
      self = @
      @currentModel.save().then(
        ( model ) ->
          self.transitionTo( 'tournament', model )
        ( reason ) ->
          self.controllerFor( 'tournamentsNew' ).set( 'errors', reason.responseJSON.errors )
      )

    cancel: () ->
      @currentModel.deleteRecord()
      @transitionTo( 'index' )

  deactivate: ->
    unless @currentModel.get( 'isSaving' )
      @currentModel.rollback()


Graude.TournamentRoute = Ember.Route.extend
  actions:
    subscribe: () ->
      session = @controllerFor( 'tournament' ).currentSession
      if session.get( 'isLoggedIn' )
        participation = @store.createRecord( 'participation' )
        participation.set( 'session', session.get( 'session' ) )
        participation.set( 'tournament', @currentModel )
        participation.save()

    unsubscribe: () ->
      session = @controllerFor( 'tournament' ).currentSession
      participation = @controllerFor( 'tournament' ).get( 'currentParticipation' )
      if session.get( 'isLoggedIn' ) and participation
        participation.deleteRecord()
        participation.save()


    update_list: () ->
      session = @controllerFor( 'tournament' ).currentSession
      participation = @controllerFor( 'tournament' ).get( 'currentParticipation' )
      if session.get( 'isLoggedIn' ) and participation
        participation.get( 'army_list' ).save()
