class User < ActiveRecord::Base
  belongs_to :review_group

  attr_accessible :andrewid, :username

  validates_presence_of :andrewid
  validates_presence_of :username

  validates_uniqueness_of :username, :message => "is not available. Please select an alternative."

  validate :username_is_not_andrewid
  
  private
  def username_is_not_andrewid
    if username == andrewid
      errors.add(:username, "Grading alias cannot be your Andrew ID.")
    end
  end

end
