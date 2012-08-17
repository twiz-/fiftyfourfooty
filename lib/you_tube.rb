class YouTube
  include HTTParty
  base_uri 'https://gdata.youtube.com'

  DEFAULT_HERO = 'Lionel Messi'

  def initialize()
    # deal with authentication when we need it, this API doesn't need any auth
  end

  def self.find_hero(name)
    hero = name
    if hero.blank?
      hero = DEFAULT_HERO
    end
    results = []

    query = {"q" => hero.downcase, "orderby" => "published", "max-results" => 10, "v" => 2, "alt" => "json"}

    response = get("/feeds/api/videos", query: query, :headers => {"User-Agent" => '54footy'})

    if response.success? && response['feed']['openSearch$totalResults']['$t'] > 0
      results = response['feed']['entry']
    end
    results
  end

  debug_output $stdout

end