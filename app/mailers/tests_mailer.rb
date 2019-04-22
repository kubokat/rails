class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email
  end

  def feedback(body)
    @body = body
    mail to: ENV["ADMIN_EMAIL"]
  end
end
