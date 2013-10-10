Graude.Session = DS.Model.extend
  email:  DS.attr( 'string' )
  name:   DS.attr( 'string' )
  nick:   DS.attr( 'string' )
  avatar: DS.attr( 'string' )

  participations: DS.hasMany( 'participation' )

  created_tournaments: DS.hasMany( 'tournament', inverse: 'creator' )
  participating_tournaments: DS.hasMany( 'tournament', inverse: 'participators' )
