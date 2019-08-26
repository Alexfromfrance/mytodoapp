class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_todolists
  has_many :todolists, through: :users_todolists
  has_many :listitems, through: :todolists, class_name: 'Listitem', source: :listitems

  def get_items
     self.todolists.map { |todo| todo.listitems }.flatten
  end

end
