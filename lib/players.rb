class Players
  include HTTParty
  base_uri 'content.guardianapis.com'

  def initialize()
    # deal with authentication when we need it, this API doesn't need any auth
  end

  def self.find(query)
    response = get("/search", query: query, :headers => {"User-Agent" => '54footy'} )

    if response.success?
      response["response"]["results"]
    else
      raise response.response    
    end
  end

  def self.find_hero(name)
    if name.nil?
      self.find(section: 'football')
    else
      n = name.downcase.gsub(' ', '-')  # lowercase with spaces replaced by dashes
      response = get("/football/#{n}?format-json&order-by=newest", :headers => {"User-Agent" => '54footy'})

      if response.success?
        response["response"]["results"]
        # user.players.create(arg)!  ?????
      else
        # if it fails (i.e. name is not found) )get the default football results
        self.find(section: 'football')
      end
    end
  end

  debug_output $stdout
end
