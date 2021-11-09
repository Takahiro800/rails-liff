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
class Tag < ApplicationRecord
  belongs_to :user

  def fetch_qiita(page: 1, limit: 10)
    qiita_config = Qiita.new(page, limit, self.name)
    return qiita_config.tag_articles
  end

  def fetch_article(page: 1, limit: 100)
    qiita_config = Qiita.new(page, limit, self.name)
    return qiita_config.search_articles
  end

end
