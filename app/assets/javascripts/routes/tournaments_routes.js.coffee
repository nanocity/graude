Graude.TournamentsIndexRoute = Graude.AuthenticatedRoute.extend
  model: () ->
    @store.findAll( 'tournament' )

Graude.TournamentsNewRoute = Graude.AuthenticatedRoute.extend
  model: () ->
    @store.createRecord( 'tournament' )

  actions:
    save: () ->
      self = @
      @modelFor( 'tournamentsNew' ).save().then(
        ( model ) ->
          self.transitionTo( 'tournament', model )
        ( reason ) ->
          self.controllerFor( 'tournamentsNew' ).set( 'errors', reason.responseJSON.errors )
      )

    cancel: () ->
      @modelFor( 'tournamentsNew' ).deleteRecord()
      @transitionTo( 'index' )
