class CreateUsersGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :users_groups do |t|
      t.integer :user_id, null: false
      t.integer :group_id, null: false

      t.index %i(user_id group_id), name: "users_groups_user_and_group_idx", unique: true

      t.timestamps
    end
  end
end
