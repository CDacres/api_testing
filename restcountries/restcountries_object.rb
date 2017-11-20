require_relative '../restcountries/services/all_countries.rb'
require_relative '../restcountries/services/search_countries.rb'
require_relative '../restcountries/services/search_language.rb'
require_relative '../restcountries/services/search_capitals.rb'

class CountriesService

  def all_countries
    AllCountries.new
  end

  def search_countries
    SearchCountries.new
  end

  def search_language
    SearchLanguage.new
  end

  def search_capital
    SearchCapital.new
  end

end
