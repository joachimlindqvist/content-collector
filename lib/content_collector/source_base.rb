class SourceBase

  def initialize(url)
    @response = open(url).read
  end

  def catch_links
    raise WrongImplementation.new("#{self.class} must expose method `catch_links`")
  end

end