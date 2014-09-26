# coding: utf-8


#require 'event_fetch/model'

module EventFetch
  module Douban
    class EventList
      #include EventFetch::Model
      attr_accessor :input, :list_url
      
      def self.parser_html(html,list_url)
        doc    = Nokogiri::HTML(html)
        events = doc.css('*[@id="db-events-list"]/ul/li')
        event_arr =[]
        events.each_with_index do |event,index|
          event_arr << new(event,{:list_url=>list_url})
        end
        event_arr
      end

      def initialize(event,opt={})
        @input = event
        @list_url = opt[:list_url]||""
      end

      def name
        @name = @input.css('a/span').first.children.text
      end

      def url
        @url = @input.css('div/a').first.attributes['href'].value
      end


      def detail
        html   = Request.get_base(url)
        event = EventFetch::Douban::Event.parser_html(html,url)
      end      

      # def source   
      #  @source = '豆瓣网'
      # end

      # def logo_url
      #   @logo_url = @input.css('a/img').first.attributes['data-lazy'].value
      # end


    end
  end
end
