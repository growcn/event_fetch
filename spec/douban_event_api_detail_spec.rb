require 'spec_helper'
require 'nokogiri'


describe EventFetch::Douban do

  it 'parser detail' do
    html = open_test_html("api_event_22051237.xml")
    url = "http://www.douban.com/event/22051237/"
    event = EventFetch::Douban::Event.parser_api(html,url)

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

    expect(event.name).to eql("赵雷2014新专辑《吉姆餐厅》，全国巡演")
    expect(event.url).to eql(url)
    expect(event.logo_url).to eql("http://img3.douban.com/view/event_poster/hlarge/public/8bcaa49da8037f7.jpg")
    expect(event.source).to eql("豆瓣网")
    expect(event.marked).to eql(true)
    expect(event.user_id).to eql(1030)
    expect(event.start_at.hour).to eql(8)
    expect(event.stop_at.hour).to eql(23)
    expect(event.category).to eql("音乐")
    expect(event.city).to eql("北京")
    expect(event.address).to eql("北京 西城区 旧鼓楼大街145号")
    expect(event.latitude).to eql("39.941986")
    expect(event.longitude).to eql("116.393806")
    expect(event.longitude).to eql("116.393806")
    expect(event.description).to eql("内容测试")

  end  

  
end