class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.text     :iqualifyId
      t.text     :name
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
    add_index :offerings, :iqualifyId
    add_index :offerings, :name
  end
end
