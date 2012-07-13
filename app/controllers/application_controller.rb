class ApplicationController < ActionController::Base
#  protect_from_forgery
  def facebook_cookies
      @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
  end
end
