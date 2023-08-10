# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :source
      t.integer :chat_id
      t.integer :participant_id

      t.timestamps
    end
  end
end
