# frozen_string_literal: true

class IncomingMessageService < ApplicationService
  # @attr_reader params [Hash]
  # - bot: [Telegram::Bot] Bot instance
  # - message: [Telegram::Bot::Types::Message] Incoming message

  INVALID_COMMAND_FORMAT = 'Неверный формат команды. Инструкцию можно вызвать командой /start'
  ERROR_MESSAGE = "Возникла ошибка. Попробуйте еще раз или нажмите /start\n\n" \
                  "Если ошибка повторяется, напишите, пожалуйста, о проблеме сюда: #{TELEGRAM_CHAT_URL}".freeze

  def call
    Array(process_incoming_message).each do |text|
      next if text.blank?

      send_message(bot, message, text)
    end
  rescue StandardError => e
    notify_support_and_log_error(e)
  end

  private

  def process_incoming_message
    return unless message.respond_to?(:text)

    case message.text
    when '/start'
      RESENDBOT_HELP_MESSAGE
    when %r{^/Answer to the Ultimate Question}i
      '42'
    when %r{^/resend[\t\s\r\n]+([^\s]+)[\t\s\r\n]+(.*)$}
      ResendService.perform(message:, chat_slug: ::Regexp.last_match(1), text: ::Regexp.last_match(2))
    when %r{^/resend}i
      INVALID_COMMAND_FORMAT
    else
      Rails.logger.info("Unknown command: #{message.inspect}")
    end
  rescue StandardError => e
    notify_support_and_log_error(e)
    ERROR_MESSAGE
  end

  def send_message(bot, message, text)
    bot.api.send_message(chat_id: message.chat.id, text:, parse_mode: 'Markdown')
  end

  def message
    params[:message]
  end

  def bot
    params[:bot]
  end
end
