namespace :justask do
  desc 'Generates test surveys (50 by default, override with count=#)'
  task generate_test_data: :environment do
    count = ENV['count'].to_i || 50

    count.times.each_with_index do |index|
      survey = Survey.create_dummy!

      (rand(10)+1).times do survey.pages << Page.create_dummy!(survey: survey) end

      survey.pages.each do |page|
        (rand(10)+1).times do page.questions << Question.create_dummy!(page: page) end
      end

      print "\r#{index+1}/#{count} Surveys created"
    end

    print "\n"

  end
end
