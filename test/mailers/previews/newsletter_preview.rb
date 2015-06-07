class NewsletterPreview < ActionMailer::Preview
  def confirmation_mail
    SubscriptionMailer.confirmation_mail(MailSubscription.last)
  end

  def newsletter
    SubscriptionMailer.newsletter(MailSubscription.last)
  end
end