class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.new_news.subject
  #
  def new_news(news, users)
    @news = news
    @admin_name = @news.user.first_name
    @body = news.body[0..50]

    @users.each do |user|
       mail to: user.email
    end
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.event_update.subject
  #
  def event_update
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
