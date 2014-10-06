# coding: utf-8

module EventFetch
  module Douban
    module Api
      class Detail
        include EventFetch::Model
        attr_accessor :doc


        def self.parser_html(html,url)
          @doc    = Nokogiri::HTML(html)
          #doc    = Nokogiri::HTML(html,nil, "utf-8")
          return new(@doc,{:url=>url})
        end

        def self.getdata(doc)
          return new(doc)
        end

        def initialize(doc,opt={})
          @source = '豆瓣网'
          @user_id ||= 1030
          @marked  = true    
          @url = opt[:url]||=""
          #puts doc.class
          #=='Nokogiri::XML::Element'
          parsing_element(doc) 
          #parsing_each
        end

        def parsing_each
          doc.xpath("//entry").each do |entry|
            parsing_element(entry)
          end              
        end        

        def parsing_element(entry)
          id_url = entry.at_xpath(".//id").text
          id =  /http:\/\/api.douban.com\/event\/(.*)/.match(id_url)[1]

          @name = entry.at_xpath(".//title").text
          @logo_url = entry.at_xpath(".//link[@rel='image-hlarge']")["href"]
          @address = entry.at_xpath('.//where')["valuestring"]
          @url = "http://www.douban.com/event/#{id}/"
          #@city = @address.split(' ').first unless @address.nil?
          @city = entry.at_xpath('.//location').text
          @category = e2z_category(entry.at_xpath(".//category")['term'])
          # puts @city
          # puts (entry.at_xpath(".//when")["starttime"]).inspect
          @start_at = format_datetime(entry.at_xpath('.//when')["starttime"])
          @stop_at  = format_datetime(entry.at_xpath('.//when')["endtime"])
          @description = entry.at_xpath('.//content').text
          point  = entry.at_xpath('.//point')
          if !point.nil?
            text_point = point.text
            @latitude = text_point.split(" ").first
            @longitude = text_point.split(" ").last
          end
        end


        def format_datetime(datetime)
          #puts "format_datetime #{datetime}"
          Time.parse(datetime)
        rescue =>e
          raise "format_datetime #{datetime}  error:"+e.inspect
        end

        def e2z_category(cate)
          #cate = "http://www.douban.com/2007#event.music"
          h={
            'music'=>'音乐',
            'exhibition'=>'展览',
            'film'=>'电影',
            'salon'=>'讲座',
            'drama'=>'戏剧',
            'party'=>'聚会',
            'sports'=>'运动',
            'travel'=>'旅行',
            'commonweal'=>'公益',
            'others'=>'其他'
          }
          category = cate.nil? ? "" : h["#{cate.split(".").last}"]
        end

      end
    end
  end
end
