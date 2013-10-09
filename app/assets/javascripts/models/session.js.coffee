Graude.Session = DS.Model.extend
  email:  DS.attr( 'string' )
  name:   DS.attr( 'string' )
  nick:   DS.attr( 'string' )
  avatar: DS.attr( 'string' )

  tournaments: DS.hasMany( 'tournament', inverse: 'creator' )
