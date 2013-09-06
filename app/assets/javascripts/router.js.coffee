# For more information see: http://emberjs.com/guides/routing/

Graude.Router.map () ->
  @resource 'players', () ->

  @resource 'tournaments', () ->
    @route 'new'
    @resource 'tournament', { path: '/:tournament_id' }, () ->
      @route 'edit'

  @resource 'session'