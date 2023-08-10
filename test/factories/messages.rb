# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id             :integer          not null, primary key
#  source         :integer
#  text           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  chat_id        :integer
#  participant_id :integer
#
FactoryBot.define do
  factory :message do
    text { 'MyText' }
    source { 1 }
    chat_id { 1 }
    participant_id { 1 }
  end
end
