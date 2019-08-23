class DailymailJob < ApplicationJob
  queue_as :default

  def perform
    mail = DailyMailer.dailymail
    mail.deliver_later
  end
end
