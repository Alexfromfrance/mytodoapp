namespace :mail do
  desc "Sending daily email to admin"
  task daily_mail: :environment do
    DailyMailer.dailymail.deliver_now
  end

end
