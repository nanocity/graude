# http://emberjs.com/guides/models/defining-a-store/

DS.RESTAdapter.reopen
  url: 'http://localhost:3000'
  namespace: 'api/v1'

Graude.ApplicationAdapter = DS.RESTAdapter
