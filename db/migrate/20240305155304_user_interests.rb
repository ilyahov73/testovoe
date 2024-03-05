class UserInterests < ActiveRecord::Migration[7.1]
  def change
    create_table :interests_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :interest
    end
  end
end
