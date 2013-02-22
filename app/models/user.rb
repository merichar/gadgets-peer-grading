class User < ActiveRecord::Base
  belongs_to :review_group
  has_one :review_group_ownership, :foreign_key => :owner_id, :class_name => 'ReviewGroup'
  has_many :reviews, :foreign_key => :reviewer_id
  has_many :self_reviews, :foreign_key => :presenter_id, :class_name => 'Review'

  attr_accessible :andrewid, :username, :review_group


  def ldap_reference
    @ldap_reference ||= CarnegieMellonPerson.find_by_andrewid( self.andrewid )
    # Add new attributes to CarnegieMellonPerson attributes before adding 
    # references to them in participant.rb
  end

  def name
    Array.[](ldap_reference["cn"]).flatten.last
  end

  def surname
    ldap_reference["sn"]
  end
  
  def email
    ldap_reference["mail"]
  end

  def department
    ldap_reference["cmuDepartment"]
  end

  def student_class
    ldap_reference["cmuStudentClass"]
  end


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
