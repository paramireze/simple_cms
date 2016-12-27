class Page < ApplicationRecord

  has_many :sections
  belongs_to  :subject, { :optional => false }
  has_and_belongs_to_many :admin_users

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("position asc")}
  scope :newest_first, lambda { order("created_at desc")}

  validates_presence_of :name
  validates_length_of :name, :maximum => 255

end
