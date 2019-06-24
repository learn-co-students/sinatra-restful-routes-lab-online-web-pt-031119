class Recipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |items|
      items.string :name
      items.string :ingredients
    end
  end
end
