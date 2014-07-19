class Question

  dummy :page

  dummy :type do
    QuestionType::TYPES[rand(QuestionType::TYPES.count)]
  end

  dummy :text do
    Faker::Lorem.words(10).join(' ')
  end

end
