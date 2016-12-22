class Section < ApplicationRecord
  belongs_to  :page
  has_many    :section_edits
  has_many    :admin_users, :through => :section_edits

  scope :visibile, lambda { where(:visibile => true) }
  scope :invisibile, lambda { where(:visibile => false) }
  scope :sorted, lambda { order("position asc")}
  scope :newest_first, lambda { order("created_at desc")}
  scope :search, lambda {|query| where (["name like ?", "%#{query}%"])}

end
