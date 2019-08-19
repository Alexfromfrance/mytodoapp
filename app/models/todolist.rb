class Todolist < ApplicationRecord
  validates :title, presence: true
end
