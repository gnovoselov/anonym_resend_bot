# frozen_string_literal: true

module AdminConcern
  extend ActiveSupport::Concern

  def admin?(participant)
    TELEGRAM_ADMINS.include?(participant&.username)
  end
end
