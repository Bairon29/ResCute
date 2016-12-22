class VideosController < ApplicationController
  # http://stackoverflow.com/questions/3364492/actioncontrollerinvalidauthenticitytoken
 skip_before_action :verify_authenticity_token
 attr_accessor :vidSearch
   #videos rendered here
 def index
 end

 def getter
   #gets data from search form
   @vidSearch = params[:search]
   #passes info into the youtube api link
   @vidData = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=pet%20#{@vidSearch}&key=#{ENV["DEVELOPER_KEY"]}"
   #gets gets json data from api link
   @jsonParse = HTTParty.get(@vidData)
   puts @jsonParse
   # byebug
   #gets the first video description
   @description = @jsonParse["items"][4]["snippet"]["description"]
   @title = @jsonParse["items"][4]["snippet"]["title"]
   #gets the first url id
   @videoId = @jsonParse['items'][0]['id']['videoId']
   Video.create(name: @title, url: @videoId)
   # @something = {vidUrl: @vidData}
   render :template => "videos/index"
 end
end
