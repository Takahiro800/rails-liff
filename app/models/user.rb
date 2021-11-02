class User < ApplicationRecord
  has_many :tags, dependent: :destroy

end
