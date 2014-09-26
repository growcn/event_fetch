# coding: utf-8

require 'net/http'
require 'open-uri'
require 'nokogiri'

module EventFetch
  module Model
    attr_accessor :name, :url, :source, :logo_url, :category,
        :originator, :cost, :address, :city, :latitude ,:longitude,
        :description, :start_at, :stop_at,
        :marked, :user_id
        
    def self.included(klass)
      klass.extend ClassMethods
      klass.send :include, InstanceMethods
    end
    module ClassMethods
        
    end
    module InstanceMethods
      def to_format(str)
        str.gsub(" ",'').strip.chomp
      end
    end
  end
end
