Graude.DatePickerView = Ember.View.extend
  templateName: 'views/date_picker'
  classNames: ['input-append date span4']

  attributeBindings: [ 'data_date:data-date', 'data_date_format:data-date-format' ]
  data_date: ''
  data_date_format: 'dd-mm-yyyy'

  didInsertElement: () ->
    self = @
    $( '.input-append.date' ).datepicker().on( 'changeDate', (event) ->
      self.set( 'controller.model.date', event.date )
    )

  dateFormat: ( () ->
    $( '.input-append.date' ).datepicker( 'setValue', moment( @get( 'controller.model.date' ) ).format( 'DD-MM-YYYY' ) )
  ).observes( 'controller.model.date' )
