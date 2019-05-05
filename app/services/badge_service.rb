class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = @test_passage.user
  end

  def check_rules
    Badge.all.map do |badge|
      badge if badge.rule_name.present? && self.send(badge.rule_name.to_sym, badge.rule_value)
    end
  end

  private

  def category(value)
    Test.names_by_category(value).length > 0 && Test.names_by_category(value).length == @current_user.completed_test.names_by_category(value).length
  end

  def level(value)
    Test.by_level(value).length > 0 && Test.by_level(value).length == @current_user.completed_test.by_level(value).length
  end

  def attempt(value)
    @current_user.tests.where(id: @test_passage.test_id).count == 1 && @test_passage.passed == true
  end

end
