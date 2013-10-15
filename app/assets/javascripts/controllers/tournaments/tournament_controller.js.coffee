Graude.TournamentController = Ember.ObjectController.extend
  players: ( () ->
    return "#{@get('participations').get('length')}/#{@get('players_limit')}"
  ).property('players_limit', 'participations')

  currentParticipation: ( () ->
    session_id = @currentSession.get( 'session.id' )

    @get( 'participations' ).filter( ( item, index, self ) ->
      item.get( 'session.id' ) == session_id
    ).objectAt(0)
  ).property( 'participations' )

  currentParticipationStatus: ( () ->
    if participation = @get( 'currentParticipation' )
      participation.get( 'status' ).capitalize()
  ).property( 'participations' )

  currentParticipationStatusLabelClass: ( () ->
    switch @get( 'currentStatus' )
      when "Pending" then "label-warning"
      else "default"
  ).property( 'status' )


