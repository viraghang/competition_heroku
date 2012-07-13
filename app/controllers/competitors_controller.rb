class CompetitorsController < ApplicationController
    
	def add
	 begin
		@competitor = Competitors.new
	#	if @facebook_cookies
		@access_token = facebook_cookies['access_token']
    @graph = Koala::Facebook::GraphAPI.new(@access_token)
    @likes = @graph.get_connections("me", "likes")
    @status = "OK"
   # end
   rescue
     nil # not logged in
   end
	end
	
	def create
		@competitor = Competitors.new(params[:competitor])
		if @competitor.save
		  CompetitorMailer.confirmation(@competitor).deliver
	      redirect_to :controller => 'thanks', :action => 'index'
	    else
	      render('add')
	    end
	end
end
