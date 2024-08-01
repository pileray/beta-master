require 'rails_helper'

RSpec.describe LineNotificationsJob, type: :job do
  include ActiveJob::TestHelper

  describe 'line_notification_job' do
    context 'userのline_notificationがtrueの場合' do
      let!(:user1) { create(:user, line_notification: true) }
      let!(:user2) { create(:user, line_notification: false) }
      let!(:user3) { create(:user, line_notification: true) }
      let!(:quiz) { Quiz.find_by!(body: '問題1の問題文です') }

      before do
        allow(Quiz).to receive(:get_notification_quiz).and_return(quiz)

        # Line::Bot::Clientのインスタンスをモックする
        @line_client = instance_double(Line::Bot::Client)
        allow(Line::Bot::Client).to receive(:new).and_return(@line_client)

        # インスタンスメソッドに対してpush_messageをスタブ
        allow(@line_client).to receive(:push_message).and_return(true)
      end

      it 'QuizのLine通知を送信すること' do
        expected_text = <<~TEXT.chomp
        【今日のクイズ🌤】

        #{quiz.decorate.truncated_body}/

          おはようございます！本日のクイズです！この読ませ押し、分かりますか？👀

          回答はコチラ💡

          https://#{Settings.default_url_options.host}/quizzes/#{quiz.id}/random_exam?openExternalBrowser=1
        TEXT

        perform_enqueued_jobs do
          LineNotificationsJob.perform_later
        end

        # @line_clientのインスタンスがpush_messageを呼び出しているか確認
        expect(@line_client).to have_received(:push_message).with(user1.authentications.first.uid, { type: 'text', text: expected_text })
        expect(@line_client).not_to have_received(:push_message).with(user2.authentications.first.uid, { type: 'text', text: expected_text })
        expect(@line_client).to have_received(:push_message).with(user3.authentications.first.uid, { type: 'text', text: expected_text })
      end
    end
  end
end
