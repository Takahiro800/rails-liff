# require 'line/bot'

class Line
  def initialize
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  # def client
  #   @client ||= Line::Bot::Client.new { |config|
  #     config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
  #     config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
  #   }
  # end

  def push(user_line_id)
    # client ||= Line::Bot::Client.new { |config|
    #   config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    #   config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    # }

    message={
        type: 'text',
        text: "hello"
        }
    user_id =  user_line_id
    response = client.push_message(user_id, message)
  end
end