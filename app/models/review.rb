class Review < ActiveRecord::Base
  belongs_to :reviewer, :class_name => 'User'
  belongs_to :presenter, :class_name => 'User'
  attr_accessible :comments, :coolness_score, :degree_of_difficulty_score, :game, :implementation_score, :reviewer, :presenter
  
  scope :incomplete, :conditions => [ "game is NULL"]
  scope :complete, :conditions => ["game is not NULL"]

  def average
    (implementation_score + degree_of_difficulty_score + coolness_score)/3
  end

  validates :implementation_score, :numericality => { :greater_than => 0, :less_than => 11 }
  validates :degree_of_difficulty_score, :numericality => { :greater_than => 0, :less_than => 11 }
  validates :coolness_score, :numericality => { :greater_than => 0, :less_than => 11 }

end
