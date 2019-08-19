class Todolist < ApplicationRecord
  validates :title, presence: true
  has_many :listitems
end
