require 'bundler/setup'
Bundler.setup

require 'event_fetch' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end


def open_test_html(file_name)
  #src = File.expand_path './', File.dirname(__FILE__)+"/douban/#{file_name}"
  src  = File.expand_path("../../spec/fixtures/douban/#{file_name}", __FILE__)
  html = File.read(src)
end