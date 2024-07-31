# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  line_notification :boolean          default(TRUE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :user do
    
  end
end
