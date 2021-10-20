require 'json'

class Output
  def initialize(file_name)
    @file_name = file_name
  end

  def json_working?
    JSON.parse(File.read(@file_name))
    true
  rescue JSON::ParserError => e
    false
  end

  def read
    JSON.parse(File.read(@file_name)) if json_working?
  end
end
