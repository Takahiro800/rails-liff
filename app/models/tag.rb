class Tag < ApplicationRecord
  belongs_to :user

  def fetch_qiita(page: 1, limit: 10)
    qiita_config = Qiita.new(page, limit, "go")
    return qiita_config.tag_articles
  end

end
