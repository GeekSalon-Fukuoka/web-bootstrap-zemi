class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :body
      t.string :title
      t.string :image
      t.integer :cost
      t.integer :taste
      t.timestamps
    end
  end
end
