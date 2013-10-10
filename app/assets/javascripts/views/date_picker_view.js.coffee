Graude.DatePickerView = Ember.View.extend
  templateName: 'views/date_picker'
  classNames: ['input-append date']

  attributeBindings: [ 'data_date:data-date', 'data_date_format:data-date-format' ]
  data_date: ''
  data_date_format: 'dd-mm-yyyy'

  didInsertElement: () ->
    $( '.input-append.date' ).datepicker()
