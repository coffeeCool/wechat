export default (appInfo) ->
  config = {}
  config.keys = appInfo.name + 'hewentao' #_1490750627161_5967
  config.middleware = [ 'errorHandler' ]

  config.security =
    csrf:
      enable: false

  config

