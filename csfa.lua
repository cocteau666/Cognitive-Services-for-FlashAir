--[[

  Microsoft Cognitive Services SDK for FlashAir using Lua

  Author:  Takeshi Sakurai
  Version: 1.0
  License: Apache License 2.0

]]

--[[

  HTTPs request

  url:  request URI
  file: photo, video file name
  key:  Cognitive Services Access Key

]]
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

--[[

  Face API

  file: photo file name 
  key:  Cognitive Services Access Key

]]

-- Face Detection
function cs_face_detect(file,key)
  url="https://api.projectoxford.ai/face/v1.0/detect"
  return cs_request(url,file,key)
end

--[[

  Emotion API

  file: photo,video file name       
  key:  Cognitive Services Access Key

]]

-- Emotion Recognition
function cs_emotion_recognize(file,key)
  url="https://api.projectoxford.ai/emotion/v1.0/recognize"
  return cs_request(url,file,key)
end

-- Emotion Recognition in Video
function cs_emotion_recognizeinvideo(file,key)
  url="https://api.projectoxford.ai/emotion/v1.0/recognizeinvideo"
  return cs_request(url,file,key)
end
