# copies the dev/lib Selenium directories to current test/selenium directory

require File.dirname(__FILE__) + '/lib/Command_Class.rb'
require File.dirname(__FILE__) + '/lib/Jasmine_Lib.rb'
require 'getoptlong'
opts = GetoptLong.new(
  ['--help', '-h', GetoptLong::NO_ARGUMENT],
  ['--target', '-t', GetoptLong::REQUIRED_ARGUMENT],
  ['--dry-run', GetoptLong::NO_ARGUMENT],
)

cmd = Command_Class.new(Jasmine_Lib.new)

opts.each do |opt, arg|
  case opt
    when '--help'
      puts  <<EOF
-h, --help:
  show help

-t, --target:
  define the target directory. default is '.'

--dry-run
  print the command, do NOT execute the command

EOF

      exit(0)

    when '--target'
      cmd.target = arg

    when '--dry-run'
      cmd.dry_run = true

    end

end

cmd.execute
