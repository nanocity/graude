Graude.Participation = DS.Model.extend
  status: DS.attr( 'string' )

  tournament: DS.belongsTo( 'tournament' )
  session: DS.belongsTo( 'session' )
