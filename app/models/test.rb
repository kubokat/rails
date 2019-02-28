class Test < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category
  belongs_to :user

  def self.names_by_category(name)
    self.joins(:category).where(title: name).order('tests.title DESC').pluck('tests.title')
  end
end
