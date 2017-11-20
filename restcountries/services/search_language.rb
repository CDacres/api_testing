require 'httparty'
require 'json'

class SearchLanguage
  include HTTParty

  base_uri 'https://restcountries.eu/rest/v2'

  def search_by_language(language)
    JSON.parse(self.class.get("/lang/#{language}").body)
  end

  def all_countries_that_speak(lang)
    all_country_names = []
    search_by_language(lang).each do |i|
      all_country_names << i['name']
    end
    all_country_names
  end

  def population_that_speak(lang)
    total_population = 0
    search_by_language(lang).each do |i|
      total_population += i['population']
    end
    total_population
  end

end
