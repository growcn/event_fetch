# coding: utf-8

module EventFetch
  module Douban
    class Event
      include EventFetch::Model
      attr_accessor :input

      def self.parser_html(html,url)
        EventFetch::Douban::Web::Detail.parser_html(html,url)
      end

      def self.parser_api(html,url)
        EventFetch::Douban::Api::Detail.parser_html(html,url)
      end
    end
  end
end
