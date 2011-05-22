class Command_Class
  attr_accessor :help, :target
  attr_reader :cmd

  def initialize
    @target = '.'
  end

  def execute
    if (@help == nil)
      do_copy
    end
  end

  def do_copy
    @cmd = "cp -R #{dir} ."
    # `cp -R #{dir} .`
  end
end


