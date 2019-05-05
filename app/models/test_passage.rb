class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: [:create, :update]

  MIN_PERCENT = 85.freeze

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def result_percent
    if self.correct_questions > 0
      (self.test.questions.size / self.correct_questions) * 100
    else
      self.correct_questions
    end
  end

  def question_index
    test.questions.index(current_question) + 1
  end

  def self.result_color(result)
    if result >= MIN_PERCENT
      :green
    else
      :red
    end
  end

  def check_time
    time_diff = (Time.current - self.created_at)

    if (time_diff / 1.minute).round < test.timer
      (test.timer * 60) - (time_diff / 1.second).round
    else
      false
    end
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids != nil
  end

  def correct_answers
    current_question.answers.correct_answer
  end

  def before_validation_set_first_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end
end
