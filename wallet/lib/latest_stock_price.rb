# lib/latest_stock_price.rb
require 'net/http'
require 'json'

class LatestStockPrice
  API_URL = "https://latest-stock-price.p.rapidapi.com"

  def self.price(stock_symbol)
    request("/price/#{stock_symbol}")
  end

  def self.prices(stock_symbols)
    request("/prices?symbols=#{stock_symbols.join(',')}")
  end

  def self.price_all
    request("/price_all")
  end

  private

  def self.request(endpoint)
    uri = URI("#{API_URL}#{endpoint}")
    req = Net::HTTP::Get.new(uri)
    req['x-rapidapi-key'] = ENV['RAPIDAPI_KEY']
    req['x-rapidapi-host'] = URI(API_URL).host

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
    JSON.parse(res.body)
  end
end
