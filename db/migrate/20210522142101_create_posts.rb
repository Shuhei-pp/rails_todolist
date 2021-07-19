class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :year
      t.integer :manth
      t.integer :day
      t.text :progress
      t.text :creater

      t.timestamps
    end
  end
end
