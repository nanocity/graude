Graude.GeolocationView = Ember.View.extend
  templateName: 'views/geolocation'

  didInsertElement: ()->
    map = new OpenLayers.Map( 'map' )
    map.addLayer( new OpenLayers.Layer.OSM() )
    map.zoomToMaxExtent()
