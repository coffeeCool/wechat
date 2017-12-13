import dd from 'ddeyes'

export default (app) ->
  class WechatController extends app.Controller
    constructor: (ctx) ->
      super ctx
      @

    oauth: ->
      { ctx } = @
      ctx.body = await ctx.service.wechat.oauth @ctx.query
    
    access_token: ->
      { ctx } = @
      ctx.body = await ctx.service.wechat.access_token ctx.request.body

    menu: ->
      { ctx } = @
      ctx.body = await ctx.service.wechat.menu ctx.request.body
    
    code: ->
      { ctx } = @
      code = @ctx.query.code
      ctx.body = await ctx.service.wechat.code code
      # @ctx.redirect 'http://www.baidu.com'
      # @ctx.redirect 'http://192.168.0.192:7001/users'
      @ctx.redirect 'http://192.168.0.192/todosWithUser'

    todosWithUser: ->
      { ctx } = @
      ctx.body = await ctx.service.wechat.todosWithUser ctx.request.body

  return WechatController