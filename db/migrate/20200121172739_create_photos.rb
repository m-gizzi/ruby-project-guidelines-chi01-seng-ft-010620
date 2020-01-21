class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :file
      t.text :caption
      t.integer :user_id
      t.integer :concert_id
      t.timestamps 
    end
  end
end
