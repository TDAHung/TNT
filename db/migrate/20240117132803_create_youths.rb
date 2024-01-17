class CreateYouths < ActiveRecord::Migration[7.0]
  def change
    create_table :youths do |t|
      t.string :name
      t.json :pages

      t.timestamps
    end
  end
end
