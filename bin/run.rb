require_relative '../config/environment'

cli = CommandLineInterface.new

#asks the user to enter their first and last name
cli.greet 
#hopefully the .titlecase will allow the input to not be case sensitive. Sometimes it seems to work, other times no. 
user_input = gets.chomp.titlecase 
#defines the teacher instance based off of the input name
user = Teacher.find_by name: user_input

#prompt user to input their id. basic form of verification, but at least it's something
cli.id 

user_id = gets.chomp.to_i

if !user || user_id != user.id
    puts " "
    puts "Sorry, there is no teacher here with that information. Please try again or speak with administration.".light_blue
    puts "If you are a new teacher you will need to speak with Jacob Kenny to be added as user".light_blue
    puts " "
    return "goodbye".light_blue 
end 



puts " "
puts "Hello ".light_blue + user.name.light_blue
puts " "

if user.meetings.length > 0
puts "Here are all of the meetings that you have on your schedule: "
puts ""
end 
#display all meetings that are currently on the teacher's schedule
user.meetings_with_student_name_and_date
#to account for the lack of the ability to enter the specific time of day that the meeting will be
puts "All students with meetings have been notified to come to their meetings during their recess periods"
puts ""

cli.menu
 
user_command = gets.chomp.downcase

if 
    user_command == "cancel"
    user.cancel_meeting
elsif     
    user_command == "clear schedule"
    user.destroy_all_meetings
elsif 
    user_command == "new meeting" 
    user.create_meeting
elsif
    user_command == "info"
    user.my_info
else 
    puts "Going to other options".light_blue 
end 

puts " "
sleep 1
 
cli.updating_student

user_input = gets.chomp.downcase

if user_input == "add mark"
   user.add_mark
   sleep 1
elsif user_input == "add student"
    user.add_student_to_club
    sleep 1
elsif user_input == "remove student"
    user.remove_student
    sleep 1
else 
    puts "Going to the other options".light_blue
end 

sleep 1

puts " "

if user.reservations.length > 0
    puts "Here are all of the room reservations that you have made:"
    puts " "
    user.my_reservations
end 

if user.reservations.length > 0
cli.changing_reservation

user_input = gets.chomp

if user_input == "cancel"
    puts "Please enter the reservation ID of the reservation that you intend to cancel"
    user_input = gets.chomp.to_i
    user.cancel_reservation(user_input)
end 
end 

cli.room_reservation

user_input = gets.chomp.downcase 

if user_input == "yes"
    user.reserve_room
else 
puts "Have a great day. Please restart the program if you need take additional actions".light_blue
puts " "
end 
