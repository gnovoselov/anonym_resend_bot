# frozen_string_literal: true

# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  link       :string
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :chat do
    name { 'MyString' }
    slug { 'MyString' }
    link { 'MyString' }
  end
end
