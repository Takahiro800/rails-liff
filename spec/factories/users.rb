# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  name         :string
#  tag          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  line_user_id :string           not null
#
FactoryBot.define do
  factory :user do
    name { "MyString" }
    tag { "MyString" }
  end
end
