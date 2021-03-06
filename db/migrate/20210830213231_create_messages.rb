# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
