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
  validates :body, presence: true
  validates :answer, presence: true
  validates :offset, presence: true

  # ransack
  def self.ransackable_attributes(auth_object = nil)
    ["answer", "body", "created_at", "id", "id_value", "offset", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["category", "quiz_category"]
  end
end
