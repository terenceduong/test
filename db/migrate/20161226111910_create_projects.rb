class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :iqualifyId
      t.text     :name
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
    add_index :projects, :iqualifyId
    add_index :projects, :name
  end
end
