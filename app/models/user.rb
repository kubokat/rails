class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(level)
    tests.where(level: level)
  end

  def tests_by_category(category)
    tests.where(category: category)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def completed_test
    tests.where('test_passages.passed = ?', true)
  end

  def admin?
    is_a?(Admin)
  end
end
