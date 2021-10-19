class output
  def initialize(file_name)
    @file_name = file_name
  end

  def read
    file = File.open(@file_name)
    file_data = file.readlines.map(&:chomp)
    file.close
    file_data
  end
end