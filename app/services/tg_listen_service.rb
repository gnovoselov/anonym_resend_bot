# frozen_string_literal: true

class TgListenService < ApplicationService
  def call
    attempts ||= 0
    Telegram::Bot::Client.run(RESENDBOT_CONFIG['token']) do |bot|
      bot.listen do |message|
        IncomingMessageService.perform(bot:, message:)
      end
    end
  rescue Telegram::Bot::Exceptions::ResponseError => e
    if (attempts += 1) > 5
      message = 'Restarting service because of an error'
      notify_support_and_log_error(e, message)
      `service run_resendbot restart`
      exit
    else
      notify_support_and_log_error(e)
      sleep 5
      retry
    end
  rescue StandardError => e
    notify_support_and_log_error(e)
  end
end
