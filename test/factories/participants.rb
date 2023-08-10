# frozen_string_literal: true

# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :participant do
    first_name { 'MyString' }
    last_name { 'MyString' }
    username { 'MyString' }
  end
end
