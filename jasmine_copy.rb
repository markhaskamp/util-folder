# copies the dev/lib Selenium directories to current test/selenium directory

class Jasmine_Lib
  attr_accessor :loc

  def initialize
    @loc = '~/dev/lib/jasmine'
  end
end

class Command_Class
  def copy_lib dir
    `cp -R #{dir} .`
  end
end


cmd = Command_Class.new
lib = Jasmine_Lib.new

cmd.copy_lib lib.loc
