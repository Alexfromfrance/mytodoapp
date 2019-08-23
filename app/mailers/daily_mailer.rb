class DailyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_mailer.dailymail.subject
    # mail to: "to@example.org"
  def dailymail
    @todolists = Todolist.all
    @users = User.all
    admin =  User.find_by(status: "admin").email
    mail(to: admin, subject: "Stats")
  end

end
