class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :caption
      t.string :description
      t.references :user, foreign_key: true, null: false
      t.integer :loadtype
      t.integer :timezone
      t.integer :updown
      t.integer :trafficlight
      t.integer :crowd
      t.timestamps
    end
  end
end
