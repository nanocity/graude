// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets//sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require graude

//for more details see: http://emberjs.com/guides/application/
Graude = Ember.Application.create({
  LOG_TRANSITIONS: true
})

Ember.Application.initializer({
  name: 'currentSession',

  initialize: function( container, application ){
    application.register( 'helper:session', Graude.SessionController );
    application.inject( 'controller', 'currentSession', 'helper:session' );

    var store = container.lookup( 'store:main' );
    var controller = container.lookup( 'controller:session' );

    store.findAll( 'session' ).then( function( sessions ){
      if( session = sessions.objectAt( 0 ) )
        controller.currentSession.set( 'content', session );
    });
  }
});

Ember.RSVP.configure( 'onerror', function(error){
  console.log( error.message );
  console.log( error.stack );
});

//= require_tree .
