module JsonParsable

  def parse(str)
    JSON.parse(str)
  rescue JSON::ParserError
    puts "Could not parse response in #{self.class} as json."
  end

end