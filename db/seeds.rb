#Student.destroy_all
#Teacher.destroy_all
#Meeting.destroy_all
#Room.destroy_all  
Reservation.destroy_all


my_gpa = [1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 2.8, 3.0, 3.2, 3.4, 3.6, 3.8, 4.0]
my_clubs = ["Chess", "Board games", "Glee", "Basketball", "Videogames", "Spanish", "Lettuce"]
my_subjects = ["Math", "Gym", "Biology", "Chemistry", "History", "Psychology", "Home Economics"]
my_grades = [9, 10, 11, 12]
my_disciplanary_marks = [0, 1, 2]
seats = [20, 10, 5, 4, 3, 2]

teacher_ids = Teacher.all.map do |teacher|
    teacher.id 
end 

room_ids = Room.all.map do |room|
    room.id
end 

#
#
#30.times do 
#    Student.create(name: Faker::Name.name, grade: my_grades.sample, gpa: my_gpa.sample, disciplanary_marks: my_disciplanary_marks.sample, club: my_clubs.sample)
#end 
#
#
#teacher1 = Teacher.create(name: Faker::Name.name, club: my_clubs[0], subject: my_subjects[0])
#teacher2 = Teacher.create(name: Faker::Name.name, club: my_clubs[1], subject: my_subjects[1])
#teacher3 = Teacher.create(name: Faker::Name.name, club: my_clubs[2], subject: my_subjects[2])
#teacher4 = Teacher.create(name: Faker::Name.name, club: my_clubs[3], subject: my_subjects[3])
#teacher5 = Teacher.create(name: Faker::Name.name, club: my_clubs[4], subject: my_subjects[4])
#teacher6 = Teacher.create(name: Faker::Name.name, club: my_clubs[5], subject: my_subjects[5])
#teacher7 = Teacher.create(name: Faker::Name.name, club: my_clubs[6], subject: my_subjects[6])

#meeting1 = Meeting.create(student_id: 155, teacher_id: 36, date: "02/04/20")
#meeting2 = Meeting.create(student_id: 155, teacher_id: 37, date: "01/20/20")
#meeting3 = Meeting.create(student_id: 156, teacher_id: 38, date: "01/09/20")
#meeting4 = Meeting.create(student_id: 157, teacher_id: 39, date: "01/13/20")
#meeting5 = Meeting.create(student_id: 158, teacher_id: 40, date: "01/15/20")
#meeting6 = Meeting.create(student_id: 159, teacher_id: 41, date: "01/07/20")
#meeting7 = Meeting.create(student_id: 160, teacher_id: 42, date: "01/24/20")
#meeting8 = Meeting.create(student_id: 161, teacher_id: 36, date: "01/19/20")
#meeting9 = Meeting.create(student_id: 162, teacher_id: 36, date: "01/05/20")


#room1 = Room.create(room_number: 1, number_of_seats: seats.sample)
#room2 = Room.create(room_number: 2, number_of_seats: seats.sample)
#room3 = Room.create(room_number: 3, number_of_seats: seats.sample)
#room4 = Room.create(room_number: 4, number_of_seats: seats.sample)
#room5 = Room.create(room_number: 5, number_of_seats: seats.sample)

#reservation1 = Reservation.create(teacher_id: teacher_ids.sample, room_id: room_ids.sample, date: "01/23/20")
#reservation2 = Reservation.create(teacher_id: teacher_ids.sample, room_id: room_ids.sample, date: "01/14/20")
#reservation3 = Reservation.create(teacher_id: teacher_ids.sample, room_id: room_ids.sample, date: "01/16/20")
#reservation4 = Reservation.create(teacher_id: teacher_ids.sample, room_id: room_ids.sample, date: "01/12/20")
#reservation5 = Reservation.create(teacher_id: teacher_ids.sample, room_id: room_ids.sample, date: "01/04/20")
#reservation6 = Reservation.create(teacher_id: teacher_ids.sample, room_id: room_ids.sample, date: "01/21/20")
#reservation7 = Reservation.create(teacher_id: teacher_ids.sample, room_id: room_ids.sample, date: "01/15/20")
#reservation8 = Reservation.create(teacher_id: teacher_ids.sample, room_id: room_ids.sample, date: "01/13/20")
#reservation9 = Reservation.create(teacher_id: teacher_ids.sample, room_id: room_ids.sample, date: "01/01/20")
