require 'content_collector/version'
require 'content_collector/exceptions'
require 'open-uri'
require 'json'
require 'content_collector/json/parse'
require 'content_collector/item'
require 'content_collector/source_base'

SOURCE_TYPES_PATH = File.join(File.dirname(__FILE__), 'content_collector', 'source_types', '*rb')
Dir[SOURCE_TYPES_PATH].each { |file| require file }

module ContentCollector
    
  SOURCE_TYPES_PATTERN = [
    { klass: RedditJson, pattern: /((\/\/|www\.)reddit\.com.*(\.json))/i}
  ]

  def self.fetch(url)
    klass = self.get_source_type(url)
    klass.new(url).catch_links
  end

  def self.get_source_type(url)
    match = SOURCE_TYPES_PATTERN.find { |source| source[:pattern].match(url) }
    if match
      match[:klass]
    else
      raise NoSourceTypeFound.new("No source type found for #{url}") 
    end
  end

end
