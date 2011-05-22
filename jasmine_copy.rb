# copies the dev/lib Selenium directories to current test/selenium directory

require File.dirname(__FILE__) + '/lib/jasmine_libs.rb'

cmd = Command_Class.new
lib = Jasmine_Lib.new

cmd.copy_lib lib.loc
