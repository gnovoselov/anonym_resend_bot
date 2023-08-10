# frozen_string_literal: true

require 'telegram/bot'

namespace :resendbot do
  task run: [:environment] do
    TgListenService.perform
  end
end
