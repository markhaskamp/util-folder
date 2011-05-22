require 'rspec'

RSpec.configure do |config|
  config.mock_with :flexmock
end

describe "Using FlexMock with RSpec" do
  it "should be able to create a mock" do
    m = flexmock(:foo => :bar)
    m.foo.should === :bar
  end
end

