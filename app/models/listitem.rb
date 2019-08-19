class Listitem < ApplicationRecord
  validates :title, presence: true
  belongs_to :todolist
end
