class CreateStudyPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :study_plans do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :plan_name

      t.timestamps
    end
  end
end
