class Reservation < ActiveRecord::Base
belongs_to :teacher
belongs_to :room
end 