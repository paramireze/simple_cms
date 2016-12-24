class Subject < ApplicationRecord

  has_many :pages

  scope :visibile, lambda { where(:visibile => true) }
  scope :invisibile, lambda { where(:visibile => false) }
  scope :sorted, lambda { order("position asc")}
  scope :newest_first, lambda { order("created_at desc")}
  scope :search, lambda {|query| where (["name like ?", "%#{query}%"])}

  validates_presence_of :name

end
