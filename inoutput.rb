require_relative './file'
require_relative './input'
require_relative './output'

class InOutPut

  def initialize(name)
    CreateFile.new(name)
    @input = Input.new(name)
    @output = Output.new(name)
  end

  def write(info)
    @input.write(info)
  end

  def read
    @output.read
  end
end