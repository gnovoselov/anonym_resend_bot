# frozen_string_literal: true

class ResendService < ApplicationService
  # @attr_reader params [Hash]
  # - message: [Telegram::Bot::Types::Message] Incoming message
  # - chat_slug: [String] A password to identify the destination chat
  # - text: [String] A message to resend to the destination chat

  def call
    return 'Чат с таким паролем не найден' unless chat

    forward_message

    "Сообщение отправлено в чат #{chat.name}"
  rescue StandardError
    "Что-то пошло не так. Попробуйте еще раз\n\n" \
    "Если ошибка повторяется, напишите, пожалуйста, о проблеме сюда: #{TELEGRAM_CHAT_URL}"
  end

  private

  def forward_message
    created_message = Message.create!(
      participant:,
      chat:,
      text: params[:text]
    )

    NotificationsService.perform(notifications: [{
                                   chat_id: chat.id,
                                   text: created_message.text,
                                   source: message.chat.id
                                 }])
  end

  def message
    @message ||= params[:message]
  end

  def chat
    @chat ||= Chat.find_by(slug: params[:chat_slug])
  end

  def participant
    @participant ||= Participant.find_or_create_by(
      first_name: message.from.first_name,
      last_name: message.from.last_name,
      username: message.from.username
    )
  end
end
