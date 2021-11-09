# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tags_on_user_id  (user_id)
#
FactoryBot.define do
  factory :tag do
    name { "MyString" }
    user_id { 1 }
  end
end
