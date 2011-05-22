# copies the dev/lib Selenium directories to current test/selenium directory

require File.dirname(__FILE__) + '/lib/Command_Class.rb'
require File.dirname(__FILE__) + '/lib/Jasmine_Lib.rb'
require 'getoptlong'
opts = GetoptLong.new(
  ['--help', '-h', GetoptLong::NO_ARGUMENT],
  ['--dry-run', GetoptLong::NO_ARGUMENT],
)

cmd = Command_Class.new(Jasmine_Lib.new)

opts.each do |opt, arg|
  case opt
    when '--help'
      puts  <<EOF
jasmine_copy.rb
  Copies the Jasmine/bdd files from source directory to the current directory

-h, --help:
  show help

--dry-run
  print the command, do NOT execute the command

EOF

      exit(0)

    when '--dry-run'
      cmd.dry_run = true

    end

end

cmd.execute
