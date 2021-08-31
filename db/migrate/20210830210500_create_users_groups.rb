class CreateUsersGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :users_groups do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.index %i(user_id group_id), name: "users_groups_user_and_group_idx", unique: true

      t.timestamps
    end
  end
end
