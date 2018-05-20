require 'net/http'
require 'uri'

namespace :tool do
  desc "get json"
  task get_json: :environment do
    cookie = CookieTool.last.cookie_str
    uri = URI.parse("https://order.aibroker.co/PriceHistory/Get?brokerId=1&symbolId=1")
    request = Net::HTTP::Get.new(uri)
    request["Cookie"] = cookie
    request["Accept-Language"] = "vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5,hu;q=0.4"
    request["User-Agent"] = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/66.0.3359.139 Chrome/66.0.3359.139 Safari/537.36"
    request["Accept"] = "*/*"
    request["Referer"] = "https://order.aibroker.co/"
    request["Authority"] = "order.aibroker.co"
    request["X-Requested-With"] = "XMLHttpRequest"

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    JSON.parse(response.body).each do |x|
      time = x["CandleTime"].slice!(6..15).to_id
      result = x["Result"]

      Candle.creaet{}
    end
  end

  task get_cookie: :environment do
    uri = URI.parse("https://order.aibroker.co/Home/Login")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/x-www-form-urlencoded"
    request["Authority"] = "order.aibroker.co"
    request["Cache-Control"] = "max-age=0"
    request["Origin"] = "https://order.aibroker.co"
    request["Upgrade-Insecure-Requests"] = "1"
    request["User-Agent"] = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/66.0.3359.139 Chrome/66.0.3359.139 Safari/537.36"
    request["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"
    request["Referer"] = "https://order.aibroker.co/Home/login?ReturnUrl=%2f"
    request["Accept-Language"] = "vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5,hu;q=0.4"
    request.set_form_data(
        "AccountId" => "187714",
        "Password" => "",
        "RememberMe" => "false",
        "server" => "1",
    )

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    cfduid_token = response['set-cookie'].partition('__cfduid=').last.partition(';').first()

    form_token = response['set-cookie'].partition('__cfduid=').last.partition(';').last().partition('.ASPXFORMSAUTH=').last.partition(';').first

    str = '__cfduid= ' + cfduid_token + ';' + ' ' + '.ASPXFORMSAUTH=' + form_token

    puts str

    CookieTool.create(cookie_str: str)
  end
end
