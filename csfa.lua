
function cs_request(url,file,key)
  contenttype = "application/octet-stream"
  mes = "<!--WLANSDFILE-->¥r¥n"
  blen = lfs.attributes(file,"size") + string.len(mes) - 17
  b,c,h = fa.request{url = url,
     method = "POST",
     headers = {["Content-Length"] = tostring(blen),
                ["Ocp-Apim-Subscription-Key"] = key,
                ["Content-Type"] = contenttype
     },
     file = file,
     body = mes
  }
  return b
end

function cs_face(file,key)
  url="https://api.projectoxford.ai/face/v1.0/recognize"
  cs_request(url,file,key)
end

function cs_emotion(file,key)
  url="https://api.projectoxford.ai/emotion/v1.0/recognize"
  cs_request(url,file,key)
end

