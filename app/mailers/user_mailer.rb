class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.ToDoEmpty.subject
  #
  def todoempty(user, todolist)
    @user = user
    @todolist = todolist
    mail(to: user.email, subject: `Vous êtes un Boss`)
  end

end

