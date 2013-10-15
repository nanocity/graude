Graude.Comment = DS.Model.extend
  body:       DS.attr( 'string' )
  created_at: DS.attr( 'date' )

  session_name:   DS.attr( 'string' )
  session_avatar: DS.attr( 'string' )

  army_list: DS.belongsTo( 'army_list' )
