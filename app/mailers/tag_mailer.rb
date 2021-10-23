class TagMailer < ApplicationMailer
  # defaultの設定
  default from: 'admin@example.com'

  def creation_email(tag)
    @tag = tag
    mail(
      subject: 'タグ登録完了メール',
      to: 'user@example.com',
      from: 'admin@example.com'
    )
  end
end
