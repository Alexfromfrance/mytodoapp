class Todolist < ApplicationRecord
  validates :title, presence: true
  has_many :listitems, dependent: :destroy

  has_many :users_todolists
  has_many :users, through: :users_todolists

  def all_done?
    listitems.all? { |listitem| listitem.status }
  end
end
