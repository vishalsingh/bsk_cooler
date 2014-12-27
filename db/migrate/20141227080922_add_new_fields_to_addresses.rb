class AddNewFieldsToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :zipcode, :integer
    add_column :addresses, :landmark, :string
    add_column :addresses, :state, :string
  end
end
