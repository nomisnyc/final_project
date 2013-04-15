class User < ActiveBase::Record
  attr_accessible :name, :email, :phone, :address, :password, :password_confirmation, :is_teacher 
  has_secure_password
  has_many :homeworks
  has_and_belongs_to_many :classrooms

end
