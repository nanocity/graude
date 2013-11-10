Graude.Participation = DS.Model.extend
  status: DS.attr( 'string' )

  tournament: DS.belongsTo( 'tournament', async: true )
  session:    DS.belongsTo( 'session', async: true )
  army_list:  DS.belongsTo( 'army_list', async: true  )
