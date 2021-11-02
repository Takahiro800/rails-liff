class User < ApplicationRecord
  has_many :tags

  def push_bot(user_line_id)
    client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }

    message={
        type: 'text',
        text: "hello"
        }
    user_id =  user_line_id
    response = client.push_message(user_id, message)
  end
end
