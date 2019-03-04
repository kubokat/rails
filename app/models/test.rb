class Test < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true }

  scope :names_by_category, -> (name) { joins(:category).where(title: name) }
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

end
