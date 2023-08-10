# frozen_string_literal: true

module ParticipantConcern
  extend ActiveSupport::Concern

  def participant_props
    if /^@/.match?(param_participant)
      [{ username: param_participant[1..] }]
    else
      ["first_name || ' ' || last_name = ? OR first_name = ?", param_participant, param_participant]
    end
  end

  def load_participant
    chat.participants.find_by(*participant_props)
  end
end
