require 'rspec'
require File.dirname(__FILE__) + '/../lib/jasmine_libs.rb'

RSpec.configure do |config|
  config.mock_with :flexmock
end

describe "Using FlexMock with RSpec" do
  it "should be able to create a mock" do
    m = flexmock(:foo => :bar)
    m.foo.should === :bar
  end
end

describe "Jasmine_Lib" do
  it "default destination directory is '.'" do
    Jasmine_Lib.new.dir_destination.should == '.'
  end
end
