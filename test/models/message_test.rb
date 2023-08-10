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
require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
