class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.integer :post_id
      t.string :picture_id

      t.timestamps
    end
  end
end
