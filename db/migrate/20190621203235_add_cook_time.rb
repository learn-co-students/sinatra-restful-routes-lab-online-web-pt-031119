class AddCookTime < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :cook_time, :string
  end
end
