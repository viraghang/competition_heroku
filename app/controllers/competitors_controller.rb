class CompetitorsController < ApplicationController

  #before_filter :parse_facebook_cookies
  #before_filter :parse_signed_request

  def parse_signed_request
    begin
      @oauth = Koala::Facebook::OAuth.new('258087090967737', 'c8557312c44f7a0a85c2420f8584c402')
      @signed_request = @oauth.parse_signed_request(params["signed_request"])
    rescue
      nil
    end
  end


  #def parse_facebook_cookies
   # @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
  #end

  def new
#    begin
      @competitor = Competitors.new
#     @access_token = @facebook_cookies["access_token"]
#     @graph = Koala::Facebook::GraphAPI.new(@access_token)
#     @likes = @graph.get_connections("me", "likes")
#     @status = "OK"
#   rescue
#     nil
#   end
  end

  def create
    @competitor = Competitors.new(params[:competitor])
    if @competitor.save
      CompetitorMailer.confirmation(@competitor).deliver
        redirect_to :controller => 'thanks', :action => 'index'
      else
        render('new')
      end
  end
end
