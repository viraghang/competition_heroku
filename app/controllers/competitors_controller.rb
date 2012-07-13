class CompetitorsController < ApplicationController
  
  before_filter :parse_facebook_cookies

  def parse_facebook_cookies
    @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
  end

	def add
		@competitor = Competitors.new
		@access_token = @facebook_cookies["access_token"]
    @graph = Koala::Facebook::GraphAPI.new(@access_token)
    @likes = @graph.get_connections("me", "likes")
    @status = "OK"
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
