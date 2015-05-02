class RedditJson < SourceBase

  include JsonParsable

  def catch_links
    get_links(parse(@response))
  end

  def get_links(json)
    return [] unless json
    children = json['data']['children']
    children.map { |c| 
      item_data = c['data']
      Item.new(item_data['url'], { link: item_data['permalink'],
                                   title: item_data['description'], 
                                   nsfw: item_data['over_18'],
                                   tags: [item_data['subreddit'].downcase] })
    }
  end
end