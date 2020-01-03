class Student < ActiveRecord::Base 
has_many :meetings
has_many :teachers, through: :meetings
end 