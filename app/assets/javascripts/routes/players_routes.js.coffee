Graude.PlayersRoute = Ember.Route.extend
  model: ()->
    return Graude.Player.find({})
