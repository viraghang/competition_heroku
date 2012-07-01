class CompetitorsController < ApplicationController
	def add
		@competitor = Competitors.new
	end

	def create
		@competitor = Competitors.new(params[:competitor])
		if @competitor.save
		  CompetitorMailer.confirmation(@competitor).deliver
	      redirect_to("/thanks.html")
	    else
	      render('add')
	    end
	end

end
