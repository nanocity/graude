Graude.ParticipatingTournamentsController = Ember.ArrayController.extend
  itemController: 'tournament'

  tournaments_count: ( () ->
    return @get('length')
  ).property( '@each.length' )
