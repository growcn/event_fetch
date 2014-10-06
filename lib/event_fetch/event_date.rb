# coding: utf-8

require 'net/http'
require 'open-uri'
require 'nokogiri'

module EventFetch
  class EventDate
    def self.parse(dateformat)
      #puts "dateformat: #{dateformat}"
      
      # 排序不能乱（‘年’ ‘~’ ‘日’）
      # TODO 改写这个
      year = Date.today.year
      if date   = /(.*?)年(.*?)月(.*?)日.*?周(.*?) (.*?):(.*?)-(.*?):(.*)/.match(dateformat)
        #dateformat="2015年01月01日 周四 20:01-22:30"
        start_at = Time.mktime(date[1].to_i, date[2].to_i, date[3].to_i,date[5],date[6])
        stop_at  = Time.mktime(date[1].to_i, date[2].to_i, date[3].to_i,date[7],date[8])

      elsif date = /(.*?)月(.*?)日 周(.*?) (.*?):(.*?) ~ (.*?)月(.*?)日 周(.*?) (.*?):(.*)/.match(dateformat)
        #dateformat="12月03日 周三 08:00 ~ 12月07日 周日 23:00"
        start_at = Time.mktime(year,date[1].to_i, date[2].to_i, date[4],date[5])
        stop_at  = Time.mktime(year,date[6].to_i, date[7].to_i, date[9],date[10])

      elsif date = /(.*?)月(.*?)日 ~ (.*?)年(.*?)月(.*?)日 每天(.*?):(.*?)-(.*?):(.*)/.match(dateformat)
        #bug1.8.7 date = /(.*?)月(.*?)日 ~ (.*?)月(.*?)日 每(.?)(.*?):(.*?)-(.*?):(.*)/.match(dateformat)
        #dateformat="09月08日 ~ 10月31日 每天10:01-21:30"
        start_at = Time.mktime(year,date[1].to_i, date[2].to_i, date[5], date[6])
        stop_at  = Time.mktime(year,date[3].to_i, date[4].to_i, date[7], date[8])  

      elsif date = /(.*?)月(.*?)日 ~ (.*?)月(.*?)日 每天(.*?):(.*?)-(.*?):(.*)/.match(dateformat)
        #bug1.8.7 date = /(.*?)月(.*?)日 ~ (.*?)月(.*?)日 每(.?)(.*?):(.*?)-(.*?):(.*)/.match(dateformat)
        #dateformat="09月08日 ~ 10月31日 每天10:01-21:30"
        start_at = Time.mktime(year,date[1].to_i, date[2].to_i, date[5], date[6])
        stop_at  = Time.mktime(year,date[3].to_i, date[4].to_i, date[7], date[8])   

      elsif date = /(.*?)月(.*?)日 ~ (.*?)月(.*?)日 每(.*?) (.*?):(.*?)-(.*?):(.*)/.match(dateformat)
        #dateformat="09月10日 ~ 11月10日 每周三、日 21:01-22:33"
        start_at = Time.mktime(year,date[1].to_i, date[2].to_i, date[6], date[7])
        stop_at  = Time.mktime(year,date[3].to_i, date[4].to_i, date[8], date[9])

      elsif date = /(.*?)月(.*?)日.*?周(.*?) (.*?):(.*?)-(.*?):(.*)/.match(dateformat)
        #dateformat="10月19日 周日 18:01-23:33"
        start_at = Time.mktime(year,date[1].to_i, date[2].to_i, date[4], date[5])
        stop_at  = Time.mktime(year,date[1].to_i, date[2].to_i, date[6], date[7])
      else
        raise '时间解析有错'
      end
      #puts ">#{date.inspect}"
      #puts "------"
      return start_at,stop_at
    rescue =>e 
      raise " '#{dateformat}' time parse error: #{e.inspect}"
    end 
  end
end
