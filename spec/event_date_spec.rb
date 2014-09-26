require 'spec_helper'
describe EventFetch::EventDate do


  it 'parser Event douban date1 ' do
    #"2015年01月01日 周四 20:00-22:00"
    start_at,stop_at = EventFetch::EventDate.parse(data_yml['date1'])
    year,month,day = 2015,01,01
    expect(start_at.year).to eql(year)
    expect(start_at.month).to eql(month)
    expect(start_at.day).to eql(day)
    expect(start_at.hour).to eql(20)
    expect(start_at.min).to eql(10)

    expect(stop_at.year).to eql(year)
    expect(stop_at.month).to eql(month)
    expect(stop_at.day).to eql(day)
    expect(stop_at.hour).to eql(22)  
    expect(stop_at.min).to eql(20)
  end


  it 'parser Event douban date2 ' do
    #"09月10日 ~ 11月10日 每周三、日 21:00-22:30"
    start_at,stop_at = EventFetch::EventDate.parse(data_yml['date2'])

    expect(start_at.year).to eql(current_year)
    expect(start_at.month).to eql(9)
    expect(start_at.day).to eql(10)
    expect(start_at.hour).to eql(21)
    expect(start_at.min).to eql(03)

    expect(stop_at.year).to eql(current_year)
    expect(stop_at.month).to eql(11)
    expect(stop_at.day).to eql(10)
    expect(stop_at.hour).to eql(22)    
    expect(stop_at.min).to eql(30)    
  end


  it 'parser Event douban date3 ' do
    #"09月08日 ~ 10月31日 每天10:00-21:30"
    start_at,stop_at = EventFetch::EventDate.parse(data_yml['date3'])

    expect(start_at.year).to eql(current_year)
    expect(start_at.month).to eql(9)
    expect(start_at.day).to eql(8)
    expect(start_at.hour).to eql(10)
    expect(start_at.min).to eql(04)    

    expect(stop_at.year).to eql(current_year)
    expect(stop_at.month).to eql(10)
    expect(stop_at.day).to eql(31)
    expect(stop_at.hour).to eql(21)    
    expect(stop_at.min).to eql(34)    

  end

  it 'parser Event douban date4 ' do
    #"12月03日 周三 08:00 ~ 12月07日 周日 23:00"
    start_at,stop_at = EventFetch::EventDate.parse(data_yml['date4'])

    expect(start_at.year).to eql(current_year)
    expect(start_at.month).to eql(12)
    expect(start_at.day).to eql(3)
    expect(start_at.hour).to eql(8)
    expect(start_at.min).to eql(30)    

    expect(stop_at.year).to eql(current_year)
    expect(stop_at.month).to eql(12)
    expect(stop_at.day).to eql(7)
    expect(stop_at.hour).to eql(23)  
    expect(stop_at.min).to eql(13)    
  end


  it 'parser Event douban date5 ' do
    #10月19日 周日 18:00-23:30 
    start_at,stop_at = EventFetch::EventDate.parse(data_yml['date5'])
    year,month,day = [current_year,10,19]

    expect(start_at.year).to eql(year)
    expect(start_at.month).to eql(month)
    expect(start_at.day).to eql(day)
    expect(start_at.hour).to eql(18)
    expect(start_at.min).to eql(13)    

    expect(stop_at.year).to eql(year)
    expect(stop_at.month).to eql(month)
    expect(stop_at.day).to eql(day)
    expect(stop_at.hour).to eql(23)    
    expect(stop_at.min).to eql(36)    
  end


  def data_yml
    file = File.expand_path './', File.dirname(__FILE__)+"/fixtures/douban_date.yml"
    YAML.load_file(file)
  end

  def current_year
    Time.now.year
  end
  
end