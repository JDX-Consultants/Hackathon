class CreateCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.integer :left
      t.integer :right
      t.integer :duration

    end
  end
end
