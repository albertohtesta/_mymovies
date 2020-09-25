class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title, :small_cover_url, :large_cover_url
      t.text :description
      t.integer :category_id
      t.timestamps
    end
  end
end