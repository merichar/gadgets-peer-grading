class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewer
      t.references :presenter
      t.string :game
      t.integer :implementation_score
      t.integer :degree_of_difficulty_score
      t.integer :coolness_score
      t.text :comments

      t.timestamps
    end
    add_index :reviews, :reviewer_id
    add_index :reviews, :presenter_id
  end
end
