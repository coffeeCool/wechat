import dd from 'ddeyes'
import 'shelljs/make'
import axios from 'axios'

target.all = ->
  # dd 'Hello World!!!'

  baseUrl = 'https://xy1g1vfw.api.lncld.net/1.1/classes/Todos'

  form =
    where:
      pubUser: '文韬'

  headers =
    'Content-Type': 'application/json'
    'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz' 
    'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
