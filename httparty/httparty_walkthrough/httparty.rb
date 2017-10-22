require 'httparty'

postcodes_call = HTTParty.get('https://api.postcodes.io/postcodes/WD247NX').body

p postcodes_call
