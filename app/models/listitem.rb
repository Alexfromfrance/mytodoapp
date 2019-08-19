class Listitem < ApplicationRecord
  validates :title, presence: true
  belongs_to :todolist
  belongs_to :itemarchive

end
