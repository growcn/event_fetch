# coding: utf-8

module EventFetch
  module Douban
    module Api
      class EventList
        include EventFetch::Model
        attr_accessor :entries

        def self.parser(html)
          doc    = Nokogiri::HTML(html)
          return new(doc).load_data
        end

        def initialize(doc,opt={})
          @entries=doc.xpath('//feed/entry')    
          puts "#{entries.size}"
        end

        def load_data
          @events = []
          @entries.each do |entry|
            #id_url = entry.at_xpath(".//id").text
            @events << EventFetch::Douban::Api::Detail.getdata(entry)
          end
          @events
        end

      end
    end
  end
end
