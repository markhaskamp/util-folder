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
    cmd.should_receive(:copy_command).never

    cmd.help = true
    cmd.execute
  end

  it "when --help is not defined, copy command is executed" do
    cmd = flexmock(Command_Class.new(Jasmine_Lib.new))
    cmd.should_receive(:copy_command).once

    cmd.execute
  end

  it "--target cmd line option redefines the target directory" do
    new_target_dir = "foo"
    Dir.rmdir(new_target_dir) if Dir.exists?(new_target_dir)

    cmd = Command_Class.new Jasmine_Lib.new
    cmd.target = "foo"

    cmd.build_command_stmt.should == "cp -R ~/dev/lib/jasmine foo"

    Dir.rmdir(new_target_dir) if Dir.exists?(new_target_dir)
  end

  it "when --dry-run is defined, copy command is not executed" do
    cmd = flexmock(Command_Class.new(Jasmine_Lib.new))
    cmd.should_receive(:copy_command).never

    cmd.dry_run = true
    cmd.execute
  end

  it "when --dry-run is defined, copy command is defined" do
    cmd = Command_Class.new(Jasmine_Lib.new)
    cmd.dry_run = true
    cmd.execute

    cmd.cmd.should == 'cp -R ~/dev/lib/jasmine .'
  end
  
  it "will create target directory if it does not exist" do
    true.should == false
    # target_dir = '~/tmp/doesnt_exist'
    # Dir.rmdir(target_dir) if Dir.exists?(target_dir)

    # cmd = flexmock(Command_Class.new(Jasmine_Lib.new))
    # cmd.target = target_dir
    # cmd.should_receive(:create_target_dir).with(target_dir).once

    # cmd.execute

    # Dir.rmdir(target_dir) if Dir.exists?(target_dir)
  end
end

