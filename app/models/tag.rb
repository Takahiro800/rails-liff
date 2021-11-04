class Tag < ApplicationRecord
  belongs_to :user

  def fetch_qiita(page: 1, limit: 10)
    qiita_config = Qiita.new(page, limit, self.name)
    return qiita_config.tag_articles
  end

end
