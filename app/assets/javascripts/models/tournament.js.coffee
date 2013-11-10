Graude.Tournament = DS.Model.extend
  name:          DS.attr( 'string' )
  description:   DS.attr( 'string' )
  address:       DS.attr( 'string' )
  date:          DS.attr( 'date' )
  players_limit: DS.attr( 'number' )

  participations: DS.hasMany( 'participation', async: true )

  creator: DS.belongsTo( 'session', inverse: 'created_tournaments', async: true )
  participators: DS.hasMany( 'session', inverse: 'participating_tournaments', async: true )
