Graude.AuthenticatedRoute = Ember.Route.extend
  actions:
    error: (reason, transition) ->
      if reason.status == 401
        @transitionTo( 'index' )
