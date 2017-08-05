class CreateLlamaRanches < ActiveRecord::Migration[5.1]
  def change
    create_table :llama_ranches do |t|
      t.float :lat, null: false
      t.float :long, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false

      t.timestamps
    end
    add_index :llama_ranches, :lat, unique: true
    add_index :llama_ranches, :long, unique: true
  end
end
