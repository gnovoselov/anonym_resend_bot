# frozen_string_literal: true

RESENDBOT_CONFIG = YAML.load_file(Rails.root.join('config', 'resendbot.yml'))
RESENDBOT_HELP_MESSAGE = File.read(Rails.root.join('README.md'))
TELEGRAM_ADMINS = %w[gnovoselov anna_olga].freeze
TELEGRAM_ADMIN_CHATS = [153_039_812, 5_589_849_475].freeze
TELEGRAM_CHAT_URL = 'https://t.me/JohnDoeCIT'
TELEGRAM_SUPPORT_CHAT = 153_039_812
INACTIVE_EXCEPTIONS = [28, 77, 45, 81, 9, 1, 76].freeze
