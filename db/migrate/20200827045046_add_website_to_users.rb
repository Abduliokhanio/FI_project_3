class AddWebsiteToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :website, :string
  end
end
