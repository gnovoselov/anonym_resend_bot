# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id             :integer          not null, primary key
#  text           :text
#  source         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  chat_id        :integer
#  participant_id :integer
#
class Message < ApplicationRecord
  belongs_to :participant
  belongs_to :chat
end
