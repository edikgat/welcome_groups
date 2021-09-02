class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :login, null: false, index: { unique: true }
      t.string :encrypted_password, null: false, default: "", index: { unique: true }


      t.timestamps null: false
    end
  end
end
