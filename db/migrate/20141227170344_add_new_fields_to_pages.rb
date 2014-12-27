class AddNewFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :link_type, :boolean
    add_column :pages, :under_heading, :string
  end
end
