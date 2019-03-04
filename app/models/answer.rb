class Answer < ApplicationRecord
  belongs_to :question

  validate :answer_counter, on: :create

  scope :correct_answer, -> { where(correct: true) }

  private

  def answer_counter
    errors.add(:answer) if question.answers.size >= 4
  end

end
