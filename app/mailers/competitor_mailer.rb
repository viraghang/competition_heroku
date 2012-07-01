class CompetitorMailer < ActionMailer::Base
  def confirmation(competitor)
  	mail( :to => competitor.email,
  		  :from => 'webmaster@competition.hu',
  		  :subject => "Pályázatát megkaptuk!"
  		)  	
  end
end
