class AddReviewGroupToUsers < ActiveRecord::Migration
  def up
    add_column :users, :review_group_id, :integer
  end

  def down
    remove_column :users, :review_group_id
  end
end
