require 'rubygems'
require 'json'
require 'net/http' 

 class StationsController < ApplicationController
 	respond_to :json, :html
  	$usaGovURI = "https://www.kimonolabs.com/api/7dii3fmo?apikey=3ORCvxPPDqCAE1cwoSI8gyVy0wsAobLp"

	def new
	end

	def index
		@stations = Station.all
		msg = { :stations => @stations }
		render :json => msg
		# respond_to do |format|
  #     		format.json  { render :json => msg } # don't do msg.to_json
  #     		format.html
  #     	end
	end

	def create
		# render plain: params[:station].inspect
		@station = Station.new(station_args)
 		@station.save
  		redirect_to @station
	end

	def show
		source = "https://www.kimonolabs.com/api/7dii3fmo?apikey=3ORCvxPPDqCAE1cwoSI8gyVy0wsAobLp"
        @data = JSON.parse(JSON.load(URI.parse(source))
        # msg = { :stations => @data }
        render :json @data
        # @da
		# @station = Station.find(params[:id])
		# response = Net::HTTP.get_response(URI.parse($usaGovURI))
  #   	data = response.body
  #   	hash = JSON.parse(data)
  #   	# logger.debug params[""]
  #   	# render :text => hash[:results].first["stations_data"].first["stations_name"].first["text"]

  # #   	obj = OpenStruct.new(@foobar)
		# # obj.data

 	# 	# respond_with(hash)
  #   	render hash["results"]["stations_data"]["stations_name"]["text"]
	end
	def getNames
		
  	end
 
#   def getNames
#     response = Net::HTTP.get_response(URI.parse($usaGovURI))
#     data = response.body
#     JSON.parse(data)
 
#     render :text => JSON.parse(data)
#   end

	private
  		def station_args
    		params.require(:station).permit(:name, :lat, :long)
  	end
end
