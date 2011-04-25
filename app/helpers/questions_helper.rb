module QuestionsHelper
  def fabricate_question_from_type(q_type)
    if q_type == Question::DICTATION
      return DictationQuestion.new
    end
    if q_type == Question::MULTIPLE_CHOICE
      return MultipleChoiceQuestion.new
    end
    nil
  end
end
