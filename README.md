# EventFetch

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'event_fetch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install event_fetch

## Usage

[活动接口](http://www.douban.com/service/apidoc/reference/event#获取城市的所有活动)

```
# api调用
event=EventFetch::Douban::Api::Event.location('beijing')
event.size
default_opt = {'type'=>all,'start-index'=>1,'max-results'=>20}

event=EventFetch::Douban::Api::Event.location('beijing',default_opt)

# web解析调用
fd = EventFetch.fetch_douban("beijing","music", 10, 1000)
fd.size
# => 10

=> "赵雷2014新专辑《吉姆餐厅》首发演唱会，北京站"
fd.map{|x|x.name}

=> ["赵雷2014新专辑《吉姆餐厅》首发演唱会，北京站 ", "冰岛乐队Bang Gang 2014“Forever Now”中国巡演", "my little airport 攻陷你的心十周年中国巡演北京站", "日本后摇天团MONO全新双专辑中国巡演", "丹麦摇滚大牌The Raveonettes 2014全新专辑《Pe'Ahi》中国巡演", "赵雷2014新专辑《吉姆餐厅》，全国巡演", "日本后摇天团MONO 2014 全新双专辑 中国巡演 北京站", "口袋唱片之意大利新古典乐团  Ashram 中国巡演", "重型音乐创刊十四周年庆典-CARCASS北京专场", "The Yours 2014年新专辑《TEENAGARTEN》中国巡演"]

detail = fd.first.detail
detail.city
=> "北京"
detail.category
=> "音乐-音乐会"
```


```
rspec spec
```

## Contributing

1. Fork it ( https://github.com/growcn/event_fetch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request