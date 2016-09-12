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

-- Face Find Similar

-- Face Group

-- Face Identify

-- Face Verify

-- Face List Add a Face to a Face List

-- Face List Create a Face List

-- Face List Delete a Face from a Face List

-- Face List Delete a Face List

-- Face List Get a Face List

-- Face List List Face Lists

-- Face List Update a Face List

-- Person Add a Person Face

-- Person Create a Person

-- Person Delete a Person

-- Person Delete a Person Face

-- Person Get a Person

-- Person Get a Person Face

-- Person List Persons in a Persin Group

-- Person Update a Person

-- Person Update a Person Face

-- Person Group Create a Person Group

-- Person Group Delete a Person Group

-- Person Group Get a Person Group

-- Person Group Get Person Group Training Status

-- Person Group List Person Groups

-- Person Group Train Person Group

-- Person Group Update a Person Group



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


--[[
  Computer Vision API

  file: photo,video file name
  key:  Cognitive Services Access Key

]]
-- Computer Vision Analyze Image
function cs_computervision_analyze(file,key)
  url="https://api.projectoxford.ai/vision/v1.0/analyze"
  return cs_request(url,file,key)
end

-- Computer Vision Describe Image
function cs_computervision_describe(file,key)
  url="https://api.projectoxford.ai/vision/v1.0/describe"
  return cs_request(url,file,key)
end

-- Computer Vision Get Thumbnail

-- Computer Vision List Domain Specific Models

-- Computer Vision OCR
function cs_computervision_ocr(file,key)
  url="https://api.projectoxford.ai/vision/v1.0/ocr"
  return cs_request(url,file,key)
end

-- Computer Vision Recognize Domain Specific Content
function cs_computervision_recognize_domain_specific_content(file,key)
  url="https://api.projectoxford.ai/vision/v1.0/models/{model}/analyze"
  return cs_request(url,file,key)
end

-- Computer Vision Tag
function cs_computervision_tag(file,key)
  url="https://api.projectoxford.ai/vision/v1.0/tag"
  return cs_request(url,file,key)
end
