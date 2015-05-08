class AddFeaturedAndOnSlideFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :feature, :boolean, default: false
    add_column :products, :on_slide, :boolean, default: false
  end
end
