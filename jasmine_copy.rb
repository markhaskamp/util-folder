# copies the dev/lib Selenium directories to current test/selenium directory

cmd = Command_Class.new
lib = Jasmine_Lib.new

cmd.copy_lib lib.loc
