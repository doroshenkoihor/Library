class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :email, null: false, index: {unique: true}
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
