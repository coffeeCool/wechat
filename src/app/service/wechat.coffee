import config from '../config/config.default'
import sha1 from 'sha1'
import dd from 'ddeyes'
import urlencode from 'urlencode'

export default (app) ->
  class WechatService extends app.Service
    constructor: (ctx) ->
      super ctx
      @

    request: (url) ->
      url = "#{url}"
      await @ctx.curl url
    
    request1: (url, opts) ->
      url = "#{url}"
      opts = {
        headers: 
          'Content-Type': 'application/json'
          'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz' 
          'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
        opts...
      }
      await @ctx.curl url, opts
    
    token = config.wechat.token
    grant_type = config.wechat.grant_type
    appId = config.wechat.appId
    appSecret = config.wechat.appSecret

    # wechat oauth
    oauth: (params) ->
      timetamp = params.timetamp
      nonce = params.nonce
      echostr = params.echostr
      signature = params.signature
      str = [token, timetamp, nonce].sort().join ''
      result = sha1 str
      if result is signature
        @ctx.body = echostr + ''
    
    # 获取 token
    access_token: (params)->
      result = await @request "https://api.weixin.qq.com/cgi-bin/token?grant_type=#{grant_type}&appid=#{appId}&secret=#{appSecret}"
      ,
        method: 'get'
        data: params
        dataType: 'json'

      buf = new Buffer result.data
      dd buf.toString()
      buf.toString()
      
    # 设置菜单
    menu: (params) ->
      result = await @request "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN"
      ,
        method: 'post'
        data: params
        dataType: 'json'
      
      result.data
    
    # 获取code换access_token等
    code: (params) ->
      result_code = await @request "https://api.weixin.qq.com/sns/oauth2/access_token?appid=#{appId}&secret=#{appSecret}&code=#{params}&grant_type=authorization_code"
      ,
        method: 'get'
        data: params
        dataType: 'json'

      buf_code = new Buffer result_code.data
      end_code = JSON.parse buf_code.toString()

      result_token = await @request "https://api.weixin.qq.com/sns/userinfo?access_token=#{end_code.access_token}&openid=#{end_code.openid}&lang=zh_CN "
      ,
        method: 'get'
        dataType: 'json'
      
      buf_userInfo = new Buffer result_token.data
      dd JSON.parse buf_userInfo.toString()
      end_userInfo = JSON.parse buf_userInfo.toString()
      
      # add lc create
      user = await @request1 "https://xy1g1vfw.api.lncld.net/1.1/users"
      ,
        method: 'post'
        data:
          username: end_userInfo.nickname
          password: end_userInfo.openid
          phoneNo: '110'
        dataType: 'json'
      dd user.data
      user.data
      
