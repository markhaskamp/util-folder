# copies the dev/lib Selenium directories to current test/selenium directory

require File.dirname(__FILE__) + '/lib/Command_Class.rb'
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
cmd.execute
