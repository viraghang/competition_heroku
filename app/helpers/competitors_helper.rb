module CompetitorsHelper
	def error_messages( object )
		render(:partial => 'shared/error_messages', :locals => {:object => object})
	end
end
