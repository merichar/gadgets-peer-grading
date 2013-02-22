class ReviewGroup < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  attr_accessible :name, :owner

  has_many :users
  
end
