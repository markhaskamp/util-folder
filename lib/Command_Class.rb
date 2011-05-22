class Command_Class
  attr_accessor :help, :target
  attr_reader :cmd

  def initialize jasmine_lib
    @target = '.'
    @jasmine_lib = jasmine_lib
  end

  def execute
    build_command_stmt

    if (@help == nil)
      do_copy
    end
  end

  def build_command_stmt
    @cmd = "cp -R #{@jasmine_lib.src} #{@target}"
  end

  def do_copy
    puts "cmd: #{@cmd}";
    # `cp -R #{dir} .`
  end
end


