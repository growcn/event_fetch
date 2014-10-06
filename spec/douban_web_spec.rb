require 'spec_helper'
require 'nokogiri'


describe EventFetch::Douban do

  it 'parser list' do
    html = open_test_html("douban_list.html")
    list_url = "http://www.douban.com/event/22048491/"
    events = EventFetch::Douban::EventList.parser_html(html,list_url)
    event = events.first
    expect(events.size).to eql(9)
    expect(event.url).to eql("http://www.douban.com/event/22048491/")
  end


  it 'parser detail' do
    html = open_test_html("douban_detail.html")
    url = "http://www.douban.com/event/22048491/"
    event = EventFetch::Douban::Event.parser_html(html,url)

    # puts event.name.inspect
    # puts event.url.inspect
    # puts event.logo_url.inspect
    # puts event.source.inspect
    # puts event.marked.inspect
    # puts event.user_id.inspect
    # puts event.date
    # puts event.start_at.inspect
    # puts event.stop_at.inspect
    # puts event.category.inspect
    # puts event.description.inspect

    expect(event.name).to eql("赵雷2014新专辑《吉姆餐厅》首发演唱会，北京站")
    expect(event.url).to eql("http://www.douban.com/event/22048491/")
    expect(event.logo_url).to eql("http://img3.douban.com/view/event_poster/raw/public/d4b663d785bd6c2.jpg")
    expect(event.source).to eql("豆瓣网")
    expect(event.marked).to eql(true)
    expect(event.user_id).to eql(1030)
    expect(event.start_at.hour).to eql(18)
    expect(event.stop_at.hour).to eql(23)
    expect(event.category).to eql("音乐-音乐会")
    expect(event.city).to eql("北京")
    expect(event.address).to eql("北京市东城区和平里西街79号糖果大楼三层")
    expect(event.latitude).to eql("39.950592")
    expect(event.longitude).to eql("116.416168")
  end  


  it 'parser detail1' do
    html = open_test_html("douban_detail1.html")
    event = EventFetch::Douban::Event.parser_html(html,'')
    expect(event.name).to eql("Carsick Cars 学校School专场")
    expect(event.address).to eql("五道营胡同53号School酒吧")
    expect(event.stop_at.min).to eql(30)
  end


end