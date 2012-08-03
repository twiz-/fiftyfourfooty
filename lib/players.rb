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

  debug_output $stdout
end
