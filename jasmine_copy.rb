# copies the dev/lib Selenium directories to current test/selenium directory

require File.dirname(__FILE__) + '/lib/Command_Class.rb'
require 'getoptlong'
opts = GetoptLong.new(
  ['--help', '-h', GetoptLong::NO_ARGUMENT]
)

cmd = Command_Class.new

opts.each do |opt, arg|
  case opt
    when '--help'
      puts  <<EOF
-h, --help:
  show help

-t, --target:
  define the target directory. default is '.'

EOF

      exit(0)

    when '--target'
      cmd.target = arg

    end

end

cmd.execute
