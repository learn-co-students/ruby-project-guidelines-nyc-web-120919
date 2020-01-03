class CommandLineInterface

    def greet
        puts "Hello please type your full name to begin."
    end 

    def id
        puts "Please enter your ID number to proceed. Do not share your ID with anyone else."
    end 

    def reservation_menu
        puts "Please take a look at your upcoming reservations"
        puts "If any updates are needed please make the change here as soon as possible"
        puts "Type 'update reservation' to update the date or room number of a reservation"
        puts "Type 'cancel reservation' to cancel a reservation"
        puts "Type 'clear reservations'if you need to cancel all of your reservations"
    end 

    def menu
        puts "Type" + " 'info' ".green + "to see some more information about yourself"
        puts "Type" + " 'cancel' ".green + "to cancel an existing meeting" 
        puts "Type" + " 'clear schedule' ".green + "to cancel all of the meetings that are currently on your schdule"
        puts "Type" + " 'new meeting' ".green + "to set up a meeting with a new student"
        puts "Or you can hit the" + " 'enter' ".green + "key to see other options"
    end


    def updating_student
        puts "Would you like to update information for any students?" 
        puts "You may select a student to join your club, or you can add a mark to their disciplinary record."
        puts "Type" + " 'add student' ".green + "to add a student to your club" 
        puts "Type" + " 'remove student' ".green + "to remove a student from your club"
        puts "Type" + " 'add mark' ".green + "add a disciplinary mark against a student"
        puts "or hit the" + " 'enter' ".green + "button to skip these options"    
    end 

    def changing_reservation
        puts "Please view your existing room reservations above"
        puts "If any reservations are no longer needed please cancel it ASAP"
        puts "Type" + " 'cancel' ".green + "to cancel an existing reservation"
        puts "Or hit any key to create a new reservation"
    end 

    def room_reservation
        puts "Would you like to reserve a room for your club? Please type" + " 'yes' ".green + "to continue"
        puts "Or type any other key to exit the program"
    end 

end 