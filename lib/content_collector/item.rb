class Item
  def initialize(source, options = {})
    @source = source
    @link = options[:link]
    @title = options[:title]
    @nsfw = options[:nsfw]
    @tags = options[:tags]
  end
end