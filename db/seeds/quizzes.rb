require 'csv'

puts 'Start inserting seed "Quizzes" ...'

csv_file_name = Rails.env.production? ? 'quizzes_production.csv' : 'quizzes_development.csv'
csv_file_path = Rails.root.join('db', 'seeds', 'quizzes_csv', csv_file_name)

CSV.foreach(csv_file_path, headers: true) do |row|
  quiz = Quiz.create!(
    body: row['body'],
    answer: row['answer'],
    offset: row['offset']
  )
  quiz.create_quiz_category!(category: Category.find_by(name: row['category']))
  puts "#{quiz.id} has created!"
end

puts 'Seeding completed!'
