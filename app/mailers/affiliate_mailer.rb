class AffiliateMailer < ActionMailer::Base
  default from: "welcome@trunkclub.com"

  def welcome(affiliate)
    @affiliate = affiliate
    mail(:to => user.email, :subject => "Welcome to Trunk Club Affiliates")
  end
end
