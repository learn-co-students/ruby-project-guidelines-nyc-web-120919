class Room < ActiveRecord::Base
has_many :reservations
has_many :teachers, through: :reservations

    def self.numbers
        my_rooms = []
        Room.all.each do |room|
            my_rooms << "Number: #{room.room_number}, Seats: #{room.number_of_seats}"
        end 
        my_rooms
    end 

    def self.available_numbers(teacher)
        Rooms.all.select do |room|
            room.seats < teacher.students_in_club
        end 
    end 

end 