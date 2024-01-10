class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :description, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
