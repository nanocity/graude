Graude.TournamentsNewController = Ember.ObjectController.extend
  errorsList: ( ()->
    self = @

    ['name', 'date', 'description', 'players_limit', 'address'].map( (item) ->
      if self.get( 'errors' )[item]
        "#{item.capitalize()} #{self.get( 'errors' )[item][0]}"
    ).filter( (n) -> !!n ) if self.get( 'errors' )
  ).property( 'errors' )
