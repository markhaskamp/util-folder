class Jasmine_Lib
  attr_accessor :loc
  attr_accessor :dir_destination

  def initialize
    @loc = '~/dev/lib/jasmine'
    @dir_destination = '.'
  end
end

class Command_Class
  def copy_lib dir
    `cp -R #{dir} .`
  end
end


