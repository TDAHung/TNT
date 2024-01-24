class AddUserIdToPopcorns < ActiveRecord::Migration[7.0]
  def change
    add_column :popcorns, :user_id, :bigint
  end
end
