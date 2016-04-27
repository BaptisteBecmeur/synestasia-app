class CreateTeacherRequests < ActiveRecord::Migration
  def change
    create_table :teacher_requests do |t|
      t.integer :user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
