class Teacher < ActiveRecord::Base
has_many :meetings
has_many :reservations
has_many :students, through: :meetings
has_many :rooms, through: :reservations


    def student_and_gpa_list
        if self.students.length > 0 
            self.students.each do |student|
                puts "Name: " + student.name + ", GPA: " + student.gpa.to_s
                puts ""
            end 
        else 
            puts ""
        end 
    end 

    def meetings_with_student_name_and_date
        if self.meetings.length > 0 
        self.meetings.each do |meeting|
            puts "There is a meeting with " + meeting.student.name.red + " on " + meeting.date.red
            puts "This student currently has a GPA of #{meeting.student.gpa}"
            puts "The meeting ID is: " + meeting.id.to_s.red
            puts ""
        end 
        else 
            puts "There are no meetings on your schedule."
        end 
    end 

    def my_info
        puts "Name: " + self.name.light_blue
        puts "Class: #{self.subject}"
        puts "Club: #{self.club} (#{students_in_my_club.count} members)"
        if students_in_my_club.count > 0
            puts "Here are the members of your club:"
            puts students_in_my_club
        end 
    end 

    def my_reservations
        self.reservations.each do |reservation|
            puts "Room #{reservation.room.room_number}".red + " is reserved for the date " + reservation.date.red
            puts "The reservation ID is " + reservation.id.to_s.red
            puts " "
        end 
    end 

    def cancel_meeting
        if self.meetings.length <= 0 
            puts "There are no meetings to cancel"
            sleep 1
            puts "Going to next screen".light_blue
            return " "
        end 
        puts "Please enter the ID (which can be seen above) of the meeting that you wish to cancel"
        input_meeting_id = gets.chomp
        my_meeting = self.meetings.find(input_meeting_id)
        self.meetings.destroy(input_meeting_id)
        puts "The meeting with " + my_meeting.student.name.red + " has been cancelled"    
    end 

    def destroy_all_meetings
        self.meetings.destroy_all
        puts "Your schedule has been cleared of all meetings".red
    end 

    def create_meeting
        #(student_name, meeting_date)
        puts "Please enter the name of the student that you need to meet with"
        student_name = gets.chomp.titlecase
        puts "Please enter the date that you will meet with this student in MM/DD/YY format"
        meeting_date = gets.chomp
        my_student = Student.all.find_by name: student_name.titlecase
        Meeting.create(student_id: my_student.id, teacher_id: self.id, date: meeting_date)
        puts " "
        puts "You now have a meeting with " + student_name.red + " on " + meeting_date.red + " The student will be notified to attend during their recess period."
    end 
 
    def add_student_to_club
        puts "Here are the students currently in your club: "
        puts students_in_my_club
        puts "Please enter the student's name that you would like to add to your club"
        student_name = gets.chomp
        my_student = Student.all.find_by name: student_name.titlecase
        if my_student.club != self.club 
        my_student.club = self.club 
        my_student.save 
        puts student_name.red + " has been added to your club"
        puts "Here are all of the students in your club now: "
        puts students_in_my_club
        else 
            puts "This student is already in your club"
        end 
    end 

    def remove_student
        puts "Here are the members currently in your club"
        puts students_in_my_club
        #my_student = Student.all.find_by name: student_name.titlecase
        puts "Type 'yes' ".green + "to remove a student from your club"
        puts "Use any other key to cancel this action"
        user_input = gets.chomp
        if user_input == "yes"
            puts "Please enter the full name of the student that you would like to remove"
            remove_student = gets.chomp.titlecase
            my_student = Student.all.find_by name: remove_student
            #binding.pry
            my_student.club = nil
            my_student.save
            #binding.pry
            puts my_student.name.red + " has been removed from your club"
        else 
            puts "Going to other options".light_blue
        end  
    end 

    def add_mark
        #(student_name, marks)
        puts "Please enter the name of the student"
        student_name = gets.chomp.titlecase
        my_student = Student.all.find_by name: student_name
        my_student_marks = (Student.all.find_by name: student_name).disciplinary_marks
        puts "This student currently has " + my_student_marks.to_s.red + " disciplinary marks"
        puts "Please enter how many disciplinary marks you are adding to this student's record"
        marks = gets.chomp.to_i
        my_student.disciplinary_marks += marks 
        my_student.save 
        puts marks.to_s.red + " mark(s) has/have been added to this student's record. " + student_name.red + " now has " + my_student.disciplinary_marks.to_s.red + " disciplinary mark(s)."
    end 

    def students_in_my_club
        my_students = Student.all.where club: self.club
        my_students.map do |student|
            student.name.red
        end 
    end 



    #def change_reservation(reservation_id)
    #    my_res = Reservation.all.find(reservation_id)
    #    my_date = my_res.date
    #    my_room_number = my_res.room.room_number
    #    puts "Please enter the date in MM/DD/YY format that you would like for this reservation to be on" 
    #    puts "If you are only changing the room number of the reservation please enter 'no change'"
    #    reservation_date = gets.chomp
    #    puts "Please enter the new room number that you need to reserve. Remember that only rooms 1 through 5 are available"
    #    puts "If you are only changing the date of the reservation please enter 'no change'"
    #    new_room_num = gets.chomp.to_i
    #    #my_room = Room.all.find_by room_number: new_room_num
    #    #binding.pry 
    #    #new_room_id = Reservation.all.find_by room: my_room
    #    if reservation_date == "no change" && new_room_num != "no change"
    #        my_room = Room.all.find_by room_number: new_room_num
    #        my_room_id = Reservation.all.find_by room: my_room
    #        my_res.room_id = my_room_id
    #        my_res.save
    #        binding.pry
    #        puts "The reservation has been updated. It will still be on #{my_date}, but will now be in room #{my_res.room.room_number}" 
    #    end 
    #end 

    def cancel_reservation(reservation_id)
        my_reservation = Reservation.all.find(reservation_id)
        Reservation.all.destroy(reservation_id)
        puts "The reservation on " + my_reservation.date.red +  " has been cancelled"
        puts " "
    end 

    #def available_rooms
    #    Room
    #end 

    def reserve_room
        puts "Reminder: you have ".red + students_in_my_club.count.to_s.red + " members ".red + "in your club".red
        puts "Be sure to choose a room with enough seats".red
        puts "Here are the room numbers that are available for reservations: #{Room.numbers}"
        puts "Please enter only the room number for the room that you would like to reserve"
        input_room_number = gets.chomp.to_i
        my_room = Room.all.find_by room_number: input_room_number
        puts "Please enter the date that you will need the room in MM/DD/YY format"
        puts "The room will be available to you from 3:30pm to 5:00pm on the selected date"
        my_date = gets.chomp
        Reservation.create(teacher_id: self.id, room_id: my_room.id, date: my_date)
        puts " "
        puts "Room number " + input_room_number.to_s.red + " has been reserved for you on " + my_date.red
        puts ""
        puts "Have a great day! Plese restart the program if you need to take additional actions" 
    end 


end 