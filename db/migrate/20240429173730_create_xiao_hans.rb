class CreateXiaoHans < ActiveRecord::Migration[7.0]
  def change
    create_table :xiao_hans do |t|
      t.string :name
      t.json :pages

      t.timestamps
    end
  end
end
