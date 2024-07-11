# == Schema Information
#
# Table name: quiz_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  quiz_id     :bigint           not null
#
# Indexes
#
#  index_quiz_categories_on_category_id              (category_id)
#  index_quiz_categories_on_quiz_id                  (quiz_id)
#  index_quiz_categories_on_quiz_id_and_category_id  (quiz_id,category_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (quiz_id => quizzes.id)
#
FactoryBot.define do
  factory :quiz_category do
    quiz { nil }
    category { nil }
  end
end
