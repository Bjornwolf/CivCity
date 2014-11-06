class AddUserToCredential < ActiveRecord::Migration
  def change
     add_column :credentials, :user_id, :integer
  end
end
