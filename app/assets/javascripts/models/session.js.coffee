Graude.Session = DS.Model.extend
  email:  DS.attr( 'string' )
  name:   DS.attr( 'string' )
  nick:   DS.attr( 'string' )
  avatar: DS.attr( 'string' )

  participations: DS.hasMany( 'participation', async: true )

  created_tournaments: DS.hasMany( 'tournament', inverse: 'creator', async: true )
  participating_tournaments: DS.hasMany( 'tournament', inverse: 'participators', async: true )
