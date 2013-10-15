# For more information see: http://emberjs.com/guides/routing/

Graude.Router.map () ->
  @resource 'players'

  @resource 'tournaments', () ->
    @resource 'tournament', { path: '/:tournament_id' }, () ->
      @resource 'participations', () ->
        @resource 'participation', { path: '/:participation_id' }, () ->

    @route 'new'
