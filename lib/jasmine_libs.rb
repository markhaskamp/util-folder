class Jasmine_Lib
  attr_accessor :loc
  attr_accessor :dir_destination

  def initialize
    @loc = '~/dev/lib/jasmine'
    @dir_destination = '.'
  end
end

class Command_Class
  attr_accessor :help

  def execute dir
    if (@help == nil)
      do_copy
    end
  end

  def do_copy
    puts "copying..."
    # `cp -R #{dir} .`
  end
end


