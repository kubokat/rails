class Badge < ApplicationRecord
  RULES = [:category, :level, :attempt]

  has_many :users, through: :user_badges
  has_many :user_badges

  def self.check_rules(tests_passage)
    Badge.all.map do |badge|
      badge if badge.rule_name.present? && self.send(badge.rule_name.to_sym, badge.rule_value, tests_passage)
    end
  end

  private

  def self.category(value, tests_passage)
    user = tests_passage.user
    Test.names_by_category(value).length > 0 && Test.names_by_category(value).length == user.completed_test.names_by_category(value).length
  end

  def self.level(value, tests_passage)
    user = tests_passage.user
    Test.by_level(value).length > 0 && Test.by_level(value).length == user.completed_test.by_level(value).length
  end

  def self.attempt(value, tests_passage)
    user = tests_passage.user
    user.tests.where(id: tests_passage.test_id).count == 1 && tests_passage.passed == true
  end
end
