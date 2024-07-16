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
require 'rails_helper'

RSpec.describe QuizCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
