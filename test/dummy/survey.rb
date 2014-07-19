class Survey

  dummy :title do
    Faker::Lorem.words(2).join(' ')
  end

  dummy :description do
    Faker::Lorem.words(10).join(' ')
  end

end
