require 'rspec'
require File.dirname(__FILE__) + '/../lib/Command_Class.rb'
require File.dirname(__FILE__) + '/../lib/Jasmine_Lib.rb'

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
  it "default source location is ~/dev/lib/jasmine" do
    Jasmine_Lib.new.src.should == '~/dev/lib/jasmine'
  end
end

describe "Command_Class" do
  it "default destination directory is '.'" do
    Command_Class.new(Jasmine_Lib).target.should == '.'
  end

  it "when --help is defined, copy command is not executed" do
    cmd = flexmock(Command_Class.new(Jasmine_Lib.new))
    cmd.should_receive(:do_copy).never

    cmd.help = true
    cmd.execute
  end

  it "when --help is not defined, copy command is executed" do
    cmd = flexmock(Command_Class.new(Jasmine_Lib.new))
    cmd.should_receive(:do_copy).once

    cmd.execute
  end

  it "--target cmd line option redefines the target directory" do
    cmd = Command_Class.new Jasmine_Lib.new
    cmd.target = "foo"

    cmd.build_command_stmt.should == "cp -R ~/dev/lib/jasmine ."
  end
end

