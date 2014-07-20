class Response

  dummy :question

  dummy :question_type do
    QuestionType::TYPES[rand(QuestionType::TYPES.count)]
  end

end
