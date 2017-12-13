# curl -X POST \
#   -H "X-LC-Id: xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz" \
#   -H "X-LC-Key: rRvdD9oizDgldNbbIpgFPd1X" \
#   -H "Content-Type: application/json" \
#   -d '{
#     "content": "每个 JavaScript 程序员必备的 8 个开发工具",
#     "user":{
#       "__type":"Pointer",
#       "className":"_User",
#       "objectId":"5a2e25fbee920a7072173e12"
#     }
#   }' \
#   https://api.leancloud.cn/1.1/classes/Post


# curl -X GET \
#   -H "X-LC-Id: xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz" \
#   -H "X-LC-Key: rRvdD9oizDgldNbbIpgFPd1X" \
#   -G \
#   --data-urlencode 'include=user' \
#   https://xy1g1vfw.api.lncld.net/1.1/classes/Todos/5a2e361a17d0090063ff38a9

# curl -X GET \
#   -H "X-LC-Id: xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz" \
#   -H "X-LC-Key: rRvdD9oizDgldNbbIpgFPd1X" \
#   -G \
#   --data-urlencode 'where={"pubUser":"文韬"}' \
#   https://xy1g1vfw.api.lncld.net/1.1/classes/Todos

# curl -X GET \
#   -H "X-LC-Id: xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz" \
#   -H "X-LC-Key: rRvdD9oizDgldNbbIpgFPd1X" \
#   -G \
#   --data-urlencode 'include=user' \
#   https://xy1g1vfw.api.lncld.net/1.1/classes/Post/5a2e2f960b61605fd59e6195
 
