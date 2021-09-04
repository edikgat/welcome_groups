class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.references :owner
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
    add_foreign_key :groups, :users, column: :owner_id
  end
end
