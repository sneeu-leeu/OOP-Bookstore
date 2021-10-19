require 'json'

class Output
  def initialize(file_name)
    @file_name = file_name
  end

  def json_working?
    JSON.parse(File.read(@file_name))
      true
    rescue JSON::ParserError => e
      flase
  end

  def read
    if json_working?
      JSON.parse(File.read(@file_name))
    end
  end
end