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
class Quiz < ApplicationRecord
  has_one :quiz_category, dependent: :destroy
  has_one :category, through: :quiz_category
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarking_users, through: :bookmarks
  validates :body, presence: true
  validates :answer, presence: true
  validates :offset, presence: true

  # ransack
  def self.ransackable_attributes(_auth_object = nil)
    %w[answer body created_at id id_value offset updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category quiz_category]
  end
end
