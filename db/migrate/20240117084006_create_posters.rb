class CreatePosters < ActiveRecord::Migration[7.0]
  def change
    create_table :posters do |t|
      t.json :image
      t.string :name

      t.timestamps
    end
  end
end
