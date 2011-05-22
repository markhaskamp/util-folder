# copies the dev/lib Selenium directories to current test/selenium directory

require File.dirname(__FILE__) + '/lib/jasmine_libs.rb'
require 'getoptlong'
opts = GetoptLong.new(
  ['--help', '-h', GetoptLong::NO_ARGUMENT]
)

opts.each do |opt, arg|
  case opt
    when '--help'
      puts  <<EOF
-h, --help:
  show help

EOF

      exit(0)
    end
end

cmd = Command_Class.new
lib = Jasmine_Lib.new

cmd.copy_lib lib.loc
