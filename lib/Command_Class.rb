class Command_Class
  attr_accessor :help, :target, :dry_run
  attr_reader :cmd

  def initialize jasmine_lib
    @help = false
    @dry_run = false

    @target = '.'
    @jasmine_lib = jasmine_lib
  end

  def execute
    build_command_stmt

    if (@help == false)
      if (@dry_run)
        puts "cmd: #{@cmd}";
      else
        copy_command
      end
    end
  end

  def build_command_stmt
    @cmd = "cp -R #{@jasmine_lib.src} #{@target}"
  end

  def copy_command
    puts "execute!"
    # `cp -R #{dir} .`
  end
end


