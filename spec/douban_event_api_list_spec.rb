require 'spec_helper'
require 'nokogiri'


describe EventFetch::Douban do

  it 'parser detail' do
    xml = open_test_html("api_events_type_music.xml")
    events = EventFetch::Douban::Api::EventList.parser(xml)
    event = events.last

    events.each do |e|
      puts e.name
    end

    expect(event.name).to eql("戏班乐队 “戏中戏”北京专场")
    expect(event.url).to eql("http://www.douban.com/event/22623369/")
    expect(event.logo_url).to eql("http://img3.douban.com/view/event_poster/hlarge/public/30a3820fe5478ba.jpg")
    expect(event.source).to eql("豆瓣网")
    expect(event.marked).to eql(true)
    expect(event.user_id).to eql(1030)
    expect(event.start_at.hour).to eql(21)
    expect(event.stop_at.hour).to eql(23)
    expect(event.category).to eql("音乐")
    expect(event.city).to eql("北京")
    expect(event.address).to eql("北京 东城区 愚公移山（北京市东城区张自忠路3-2号段祺瑞执政府旧址大门西侧）")
    expect(event.latitude).to eql("39.933762")
    expect(event.longitude).to eql("116.416153")
  end  

  

  
end