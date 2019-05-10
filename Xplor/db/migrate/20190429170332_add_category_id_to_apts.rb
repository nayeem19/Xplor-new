class AddCategoryIdToApts < ActiveRecord::Migration
  def change
    add_column :apts, :category_id, :integer
  end
end
