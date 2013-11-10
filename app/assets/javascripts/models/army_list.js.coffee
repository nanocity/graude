Graude.ArmyList = DS.Model.extend
  list: DS.attr( 'string' )
  updated_at: DS.attr( 'date' )

  participation: DS.belongsTo( 'participation', async: true )
  comments: DS.hasMany( 'comment', async: true )
