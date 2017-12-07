export default (app) ->
  app.get '/oauth', app.controller.wechat.oauth
  app.get '/access_token', app.controller.wechat.access_token
  app.post '/menu', app.controller.wechat.menu
  app.get '/code', app.controller.wechat.code

  return
