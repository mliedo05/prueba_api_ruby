require "uri"
require "net/http"
require "json"

def request(link,key)
    url = URI(link+key)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    return JSON.parse (response.read_body)
end

def build_web_page(data)

    html = 
    '<!DOCTYPE html>
    <html lang="es">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Photos api nasa</title>
    </head>
    <body>
    <ul>'

    data["photos"].each do |fotos|
        fotos["img_src"]
        html += "<li><img src='#{fotos['img_src']}'></li>\n" 
    end

    html += '</ul>
    </body>
    </html>'
    return html
end

data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=","r0IVneVCawcka91m55mRUuVGhMuSmgz3ibtoJhzv")