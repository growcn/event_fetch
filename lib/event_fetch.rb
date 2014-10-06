
require 'event_fetch/request'
require 'event_fetch/model'
require 'event_fetch/event_date'
require 'event_fetch/douban/base'
require 'event_fetch/douban/event'
require 'event_fetch/douban/web/detail'

require 'event_fetch/douban/api/detail'
require 'event_fetch/douban/api/event_list'
require 'event_fetch/douban/api/event'

module EventFetch
  extend self

  #EventFetch.fetch_douban('beijing',"music", 10, 1000)
  def fetch_douban(city, type, province_id, city_id)
    EventFetch::Douban::Base.fetch( "#{city}","#{type}", province_id, city_id)
  end


end