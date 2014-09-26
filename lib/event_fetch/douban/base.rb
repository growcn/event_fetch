# coding: utf-8

require 'net/http'
require 'open-uri'
require 'nokogiri'
require 'event_fetch/douban/event_list'

module EventFetch

  module Douban
    #attr_accessor :sleep_time
    class Base
      def self.douban_events_url(location,type)
        "http://www.douban.com/location/#{location}/events/future-#{type}"
      end

      def self.fetch(location,type, province_id, city_id)
        url = douban_events_url(location,type)
        html   = Request.get_base(url)
        events = EventFetch::Douban::EventList.parser_html(html,url)
      end 
      

      # def self.paser_detail(ef)
      #   url = ef.url
      #   doc   = Request.get_base(url)
      #   ef.category =   doc.css('h2 .pl2').first.inner_html rescue ''
      #   ef.description = doc.css('#edesc_f').first.inner_html rescue ''
      #   ef.user_id = 1030
      #   ef.marked  = true
      #   ef
      # end
    end
  end
end
