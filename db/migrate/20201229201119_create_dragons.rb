class CreateDragons < ActiveRecord::Migration
  def change
    create_table :dragons do |t|
      t.string :name
      t.string :color
      t.string :breed
      t.string :personality
      t.string :treasure

      t.timestamps null: false
    end
  end
end
