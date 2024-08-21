puts 'Start inserting seed "categories" ...'
%w[エンタメ スポーツ 生活 社会 文学・歴史 自然科学 芸術・音楽].each do |name|
  category = Category.create!(name: name)
  puts "#{category.name} has created!"
end
puts 'Seeding completed!'
