class Listitem < ApplicationRecord
  validates :title, presence: true
  belongs_to :todolist

  include PgSearch::Model
  pg_search_scope :search_by_title,
  against: [ :title],
  using: {
      tsearch: { prefix: true }
    }

  end
