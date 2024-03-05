class UserSkill < ActiveRecord::Migration[7.1]
  def change
    create_table :skills_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :skill
    end
  end
end
