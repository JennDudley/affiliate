class AffiliateMailer < ActionMailer::Base
  default :from => "notifications@trunkclub.com"

  def welcome_email(affiliate)
    @affiliate = affiliate
    mail(:to => user.email, :subject => "Welcome to Trunk Club Affiliates")
  end

  # def new(affiliate)
  # 	@affiliate = affiliate
  # 	mail(:to => bobbileehartman@gmail.com, :subject => "You have a New Affiliate Applicant")
  # end
end
