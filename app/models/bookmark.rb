# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quiz_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_bookmarks_on_quiz_id              (quiz_id)
#  index_bookmarks_on_user_id              (user_id)
#  index_bookmarks_on_user_id_and_quiz_id  (user_id,quiz_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (quiz_id => quizzes.id)
#  fk_rails_...  (user_id => users.id)
#
class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  validates :user_id, uniqueness: { scope: :quiz_id }
end
