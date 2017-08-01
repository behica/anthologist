class AddTierToStories < ActiveRecord::Migration
  def change
    add_column :stories, :tier, :integer
  end
end
