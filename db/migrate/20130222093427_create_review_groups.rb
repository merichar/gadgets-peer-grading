class CreateReviewGroups < ActiveRecord::Migration
  def change
    create_table :review_groups do |t|
      t.references :owner
      t.string :name

      t.timestamps
    end
    add_index :review_groups, :owner_id
  end
end
