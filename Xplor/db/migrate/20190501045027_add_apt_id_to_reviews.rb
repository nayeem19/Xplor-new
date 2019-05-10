class AddAptIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :apt_id, :integer
  end
end
