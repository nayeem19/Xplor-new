class AddUserIdToApts < ActiveRecord::Migration
  def change
    add_column :apts, :user_id, :integer
  end
end
