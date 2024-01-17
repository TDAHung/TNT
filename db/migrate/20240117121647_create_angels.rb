class CreateAngels < ActiveRecord::Migration[7.0]
  def change
    create_table :angels do |t|
      t.string :name
      t.json :pages

      t.timestamps
    end
  end
end
