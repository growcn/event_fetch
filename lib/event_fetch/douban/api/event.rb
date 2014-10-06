# coding: utf-8

require 'net/http'
require 'open-uri'
require 'nokogiri'

module EventFetch
  module Douban
    module Api
      class Event
        # 获取活动
        # 获取用户的所有活动
        
        # 获取城市的所有活动
        # type  活动类型  all, commonweal, drama, exhibition, film, music, others, party, salon, sports, travel. 可选参数,默认为all
        # start-index 起始元素  
        # max-results 返回结果的数量 

        def self.location(location_id='beijing',opt={})
          opt['type']||='all'
          opt['start-index']||=1
          opt['max-results']||=20

          params =[]
          params << "type=#{opt['type']}"
          params << "start-index=#{opt['start-index'].to_i}"
          params << "max-results=#{opt['max-results'].to_i}"

          api = "http://api.douban.com/event/location/#{location_id}"
          api += "?#{params.join("&")}"

          puts api
          
          xml   = EventFetch::Request.get_base(api)
          EventFetch::Douban::Api::EventList.parser(xml)
        end

        # 搜索活动
        # 创建新活动
        # 参加活动
        # 更新活动
        # 删除活动

      end
    end
  end
  
end
