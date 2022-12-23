class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: 'https://cdn.justjaredjr.com/wp-content/uploads/headlines/2017/02/selena-gomez-teases-new-song-listen-now.jpg'
      t.text :bio, default: 'This is bio section'
      t.integer :posts_counter, default:0

      t.timestamps
    end
  end
end
