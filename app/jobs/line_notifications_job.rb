require 'line/bot'

class LineNotificationsJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 3

  # rubocop:disable Metrics/MethodLength
  def perform(*_args)
    users = User.where(line_notification: true)

    users.each do |user|
      @quiz = Quiz.get_notification_quiz(user)

      message_text = <<~TEXT.chomp
        【今日のクイズ🌤】

        #{@quiz.decorate.truncated_body}/

          おはようございます！本日のクイズです！この読ませ押し、分かりますか？👀

          回答はコチラ💡

          https://#{Settings.default_url_options.host}/quizzes/#{@quiz.id}/random_exam?openExternalBrowser=1
      TEXT

      message = { type: 'text', text: message_text }
      uid = user.authentications.find_by(provider: 'line').uid
      client.push_message(uid, message)
      logger.info 'PushLineSuccess'
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def client
    Line::Bot::Client.new do |config|
      config.channel_id = Rails.application.credentials.line_message.channel_id
      config.channel_secret = Rails.application.credentials.line_message.secret_key
      config.channel_token = Rails.application.credentials.line_message.access_token
    end
  end
end
