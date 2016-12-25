class Page < ApplicationRecord

  belongs_to  :subject, { :optional => false }
  has_and_belongs_to_many :admin_users

  scope :visibile, lambda { where(:visibile => true) }
  scope :invisibile, lambda { where(:visibile => false) }
  scope :sorted, lambda { order("position asc")}
  scope :newest_first, lambda { order("created_at desc")}

  validates_presence_of :name
  validates_length_of :name, :maximum => 255

end
