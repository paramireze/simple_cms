class Subject < ApplicationRecord
  scope :visibile, lambda { where(:visibile => true) }
  scope :invisibile, lambda { where(:visibile => false) }
  scope :sorted, lambda { order("position asc")}
  scope :newest_first, lambda { order("created_at desc")}
  scope :search, lambda {|query| where (["name like ?", "%#{query}%"])}
end
