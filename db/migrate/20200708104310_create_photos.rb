class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :photo, null: false
      t.references :post, foreign_key: true, null: false
      t.timestamps
    end
  end
end
