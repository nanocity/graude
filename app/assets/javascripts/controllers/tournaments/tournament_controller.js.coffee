Graude.TournamentController = Ember.ObjectController.extend
  currentPlayers: ( () ->
    return "#{@get('participations').get('length')}/#{@get('players_limit')}"
  ).property('players_limit', 'participations')

  status: ( () ->
    session_id = @currentSession.get( 'session.id' )
    @get( 'participations' ).filter( ( item, index, self ) ->
      item.get( 'session.id' ) == session_id
    ).objectAt(0).get( 'status' ).capitalize()
  ).property( 'participations' )

  statusLabelClass: ( () ->
    switch @get( 'status' )
      when "Pending" then "label-warning"
      else "default"
  ).property( 'status' )
