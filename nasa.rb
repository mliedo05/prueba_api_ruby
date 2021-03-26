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