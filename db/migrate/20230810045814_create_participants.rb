# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :username

      t.timestamps
    end
  end
end
