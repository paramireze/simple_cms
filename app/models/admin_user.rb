class AdminUser < ApplicationRecord
  has_and_belongs_to_many :pages
  #self.table_name ="admin_users"

end
