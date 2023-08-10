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
class Participant < ApplicationRecord
  has_many :messages, dependent: :nullify

  def full_name
    name = [first_name, last_name].reject(&:blank?).join(' ')
    return name if name.present?

    username
  end

  def full_reference
    result = []
    result << "@#{username}" if username
    result << full_name
    result.join(' ')
  end
end
