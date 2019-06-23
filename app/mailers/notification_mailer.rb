class NotificationMailer < ApplicationMailer

  def self.send_mail(news, users)
    users.each do |user|
      new_news(news,user).deliver_later
    end
  end

  def new_news(news, user)
    @news = news
    @admin_name = @news.user.first_name
    @full_name = user.full_name

    mail(to: user.email, subject: 'Added New News')  
  end

  def self.send_notification(event, users)
    users.each do |user|
      event_update(event, user).deliver_later
    end
  end

  def event_update(event, user)
    @full_name = user.user.full_name
    @event = event

    mail(to: user.user.email, subject: 'Update in the Event')
  end
end
