require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Weather" do

  it "should fetch some data" do
    info = Weather.run(:location => "04157")
    info.should_not be_nil
    data = info.parse
    data.is_a?(Array).should == true
    data.first.low.should_not be_nil
    data.first.high.should_not be_nil
    data.first.is_a?(WeatherData).should be true
  end

  context "WeatherData converter" do

    it "should convert fahrenheit to celsius" do
      data = WeatherData.new
      data.low = 0
      lambda {data.celsius_low}.should_not raise_error
      data.celsius_low.round.should == -18
      data.high = 21
      lambda {data.celsius_high}.should_not raise_error
      data.celsius_high.round.should == -6
    end
    
  end

  context "GoogleWeatherFetcher" do

    it "should fetch some data" do
      result = GoogleWeatherFetcher.fetch("leipzig")
      result.should_not be nil
      result.empty?.should_not be true
      result.include?("Leipzig").should be true
    end
  end

  context "Rails" do
    
  end

end
