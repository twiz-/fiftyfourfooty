require 'nokogiri'
class YouTubePresenter

  def initialize(feed)
    @feed = feed
  end

  def thumbnail_url
    @feed['media$group']['media$thumbnail'].select{|x| x['yt$name'] == 'default'}.first['url']
  end

  def video_url
    @feed['link'].select{|x| x['rel'] == 'alternate'}.first['href']
  end

  def description
    @feed['media$group']['media$description']['$t']
  end

  def title
     @feed['title']['$t']
  end

  def published_date
     @feed['published']['$t']
  end

  def updated_date
     @feed['updated']['$t']
  end

end