class AddPriceToStories < ActiveRecord::Migration
  def change
    add_column :stories, :price, :decimal, :precision => 8, :scale => 2
  end
end
