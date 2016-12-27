class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.belongs_to :offering,      index: true
      t.belongs_to :iqualify_user, index: true
      t.boolean    :isFacilitator
      t.boolean    :isReadonly

      t.timestamps
    end
  end
end