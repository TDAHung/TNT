class CreatePopcorns < ActiveRecord::Migration[7.0]
  def change
    create_table :popcorns do |t|
      t.references :popcornable, polymorphic: true
      t.timestamps
    end
  end
end
