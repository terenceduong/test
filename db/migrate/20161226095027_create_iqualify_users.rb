class CreateIqualifyUsers < ActiveRecord::Migration
  def change
    create_table :iqualify_users do |t|
      t.string  :iqualifyId
      t.text    :email
      t.string  :studentId
      t.text    :firstName
      t.text    :lastName
      t.string  :mobile
      t.boolean :isFacilitator
      t.boolean :isReadonly

      t.timestamps
    end
    add_index :iqualify_users, :iqualifyId, unique: true
    add_index :iqualify_users, :email, unique: true
    add_index :iqualify_users, :studentId
  end
end
