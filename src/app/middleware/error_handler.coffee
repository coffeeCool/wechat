module.exports = (option, app) ->
  (ctx, next) ->
    try
      await next()
    catch 
      app.emit 'error', err, @
      status = err.status or 500
      error = 
        if status is 500 and app.config.env is 'prod'
        then 'Internal Server Error'
        else err.message

      ctx.body ={
        error
      }
      if status is 422
        ctx.body.detail = err.errors

      ctx.status = status
        