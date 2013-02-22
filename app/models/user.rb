class User < ActiveRecord::Base
  belongs_to :review_group

  attr_accessible :andrewid, :username

  validates_presence_of :andrewid
  validates_presence_of :username

  validates_uniqueness_of :username, :message => "is not available. Please select an alternative."
end
