require 'httparty'
require 'json'

class SearchCapital
  include HTTParty

  base_uri 'https://restcountries.eu/rest/v2'

  def search_by_capital(capital)
    JSON.parse(self.class.get("/capital/#{capital}").body)
  end

end
