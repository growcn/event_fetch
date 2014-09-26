# coding: utf-8

require 'net/http'
require 'open-uri'
require 'nokogiri'

module EventFetch
  class Request
    def self.get_base(url,headers={})
      headers = {"User-Agent"=>"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.99 Safari/533.4"}
      uri = URI.parse(url)
      http      = Net::HTTP.new(uri.host, uri.port)
      resp      = http.get(url,headers)
      html      = resp.body
    end 
  end
end
