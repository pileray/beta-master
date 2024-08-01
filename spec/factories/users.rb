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
    line_notification { true }

    after(:create) do |user|
      create(:authentication, user: user)
    end
  end
end
