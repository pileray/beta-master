# == Schema Information
#
# Table name: quizzes
#
#  id         :bigint           not null, primary key
#  answer     :string           not null
#  body       :text             not null
#  offset     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :quiz do
    body { "MyText" }
    answer { "MyString" }
    offset { 3 }

    after(:create) do |quiz, evaluator|
      category = evaluator.category || Category.all.sample(1).first
      create(:quiz_category, quiz: quiz, category: category)
    end

    transient do
      category { nil }
    end
  end
end
