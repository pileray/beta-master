# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  line_notification :boolean          default(TRUE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_quizzes, through: :bookmarks, source: :quiz

  def bookmark(quiz)
    bookmarks.create!(quiz_id: quiz.id)
  end

  def unbookmark(quiz)
    bookmarks.find_by!(quiz_id: quiz.id).destroy!
  end

  def bookmark?(quiz)
    bookmarks.exists?(quiz_id: quiz.id)
  end
end
