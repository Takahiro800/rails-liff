require 'json'
require 'net/https'
require "uri"

class Qiita
  def initialize(page, limit, tag)
    @page = page
    @limit = limit
    @tag = tag
  end

  def tag_articles
    uri = URI("https://qiita.com/api/v2/tags/#{@tag}/items?page=#{@page}&per_page=#{@limit}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"
    headers = { "Authorization" => "Bearer #{ENV['QIITA_TOKEN']}", "Content-Type" => "application/json" }
    # headers = { "Content-Type" => "application/json" }
    response = http.get(uri, headers)
    res = JSON.parse(response.body)
  end
end