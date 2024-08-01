require 'line/bot'

class LineNotificationsJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 3

  def perform(*args)
    users = User.where(line_notification: true)

    users.each do |user|
      @quiz = Quiz.get_notification_quiz(user)

      message_text = "【今日のクイズ🌤】\n\nおはようございます！本日のクイズです！この読ませ押し、分かりますか？👀\n\n#{@quiz.decorate.truncated_body}/\n\n回答はコチラ💡\n\nhttps://#{Settings.default_url_options.host}/quizzes/#{@quiz.id}/random_exam?openExternalBrowser=1"

      message = { type: 'text', text: message_text }
      uid = user.authentications.where(provider: 'line').take.uid
      response = client.push_message(uid, message)
      logger.info "PushLineSuccess"
    end
  end

  private
  def client
    Line::Bot::Client.new { |config|
      config.channel_id = Rails.application.credentials.line_message.channel_id
      config.channel_secret = Rails.application.credentials.line_message.secret_key
      config.channel_token = Rails.application.credentials.line_message.access_token
    }
  end
end
