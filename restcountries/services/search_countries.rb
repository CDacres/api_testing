require 'httparty'
require 'json'

class SearchCountries
  include HTTParty

  base_uri 'https://restcountries.eu/rest/v2'

  def search_for_a_country(country_name)
    JSON.parse(self.class.get("/name/#{country_name}").body)
  end

end
