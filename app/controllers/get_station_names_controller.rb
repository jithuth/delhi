require 'rubygems'
require 'json'
require 'net/http'

class GetStationNamesController < ApplicationController


  respond_to :json
  $usaGovURI = "https://www.kimonolabs.com/api/7dii3fmo?apikey=3ORCvxPPDqCAE1cwoSI8gyVy0wsAobLp"
 
  def getNames
    response = Net::HTTP.get_response(URI.parse($usaGovURI))
    data = response.body
    JSON.parse(data)
 
    render :text => JSON.parse(data)
  end
end
