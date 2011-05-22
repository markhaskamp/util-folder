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

    if (@help == false)
      build_command_stmt
      if (@dry_run)
        puts "cmd: #{@cmd}";
      else
        copy_command
      end
    end
  end

  def build_command_stmt
    if (@dry_run == false) 
      create_target_dir(@target) unless (Dir.exists?(@target))
    end

    @cmd = "cp -R #{@jasmine_lib.src} #{@target}"
  end

  def copy_command
    `#{@cmd}`
  end

  def create_target_dir target
    Dir.mkdir target
  end
end


