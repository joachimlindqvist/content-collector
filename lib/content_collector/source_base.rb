class SourceBase

  def initialize(url)
    @response = open(url).read
  end
  
end