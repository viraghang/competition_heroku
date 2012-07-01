class CompetitorMailer < ActionMailer::Base
  def confirmation(competitor)
  	mail( :to => competitor.email,
  		  :from => 'app5646052@heroku.com',
  		  :subject => "Pályázatát megkaptuk!"
  		)  	
  end
end
