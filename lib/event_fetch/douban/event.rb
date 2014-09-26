# coding: utf-8

module EventFetch
  module Douban
    class Event
      include EventFetch::Model
      attr_accessor :input

      def self.parser_html(html,url)
        doc    = Nokogiri::HTML(html)
        return new(doc,{:url=>url})
      end


      def initialize(input,opt={})
        @input = input
        @source = '豆瓣网'
        @user_id ||= 1030
        @marked  = true    
        @url = opt[:url]||=""
        @input.css("div.event-detail").map do |x| 
           name_text = x.children[1].children.text.strip 
           value_test = x.children.children.text.gsub(name_text,'')
            # if /地点:/ =~ name_text
           @cost= value_test if /费用:/ =~ name_text
           @category= value_test if /类型:/ =~ name_text
           @originator =  value_test if /发起人:/ =~ name_text
        end

        @input.css("span.micro-address/meta").map do |x|
          itemprop = x.attributes['itemprop'].value
          content = x.attributes['content'].value
          if itemprop == 'latitude'
            @latitude = content
          end
          if itemprop == 'longitude'
            @longitude = content
          end
        end

      end

      # def url
      #   @url = @input.css('div/a').first.attributes['href'].value
      # end

      def name
        to_format "#{@input.css('div.event-info > h1').first.children.first}" #inspect
      end

      def logo_url
        @input.css('div.poster/a').first.attributes['href'].value
      end

      def date
        adate = to_format("#{@input.css('.calendar-str-item').first.children.text}")
        start_at,stop_at = EventFetch::EventDate.parse(adate)
      end

      def start_at
        date.first
      end

      def stop_at
        date.last
      end

      def city
        to_format("#{@input.css("span.micro-address").children.children.first}")
      end

      def address
        to_format("#{@input.css("span.micro-address").children.children.last}")
      end

      def description
        @input.css("#edesc_s").first.inner_html rescue ""
      end

      # def category
      #   @input.css('div.poster/a').first.attributes['href'].value
      #   #event-info > div.event-info > div:nth-child(5) > a
      # end

      #    date = /时间：(.*?)年(.*?)月(.*?)日/.match(event.css('.pl').first.inner_text)
      #     @event.start_at = Time.mktime(date[1].to_i, date[2].to_i, date[3].to_i, 9)
      #     @event.stop_at  = Time.mktime(date[1].to_i, date[2].to_i, date[3].to_i, 18)

    end
  end
end
