class Response

  dummy :question

  dummy :type do
    QuestionType::TYPES[rand(QuestionType::TYPES.count)]
  end

end
