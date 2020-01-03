Meeting Scheduler and Room Reservation Tool for Teachers

General Information:

The purpose of this application is to be a helper tool for school teachers. The main function is for the teacher to be able to schedule new meetings with their students - possibly to go over school work, to discuss items relating to the student clubs for which the teacher runs, or to take disciplanary action against a student. 

Additionally, the the Teacher is able to reserve rooms at the school. They will be able to select a room by using the room number, and also by filtering the rooms by number of seats. This could be useful for scheduling club meetings, as some of the clubs are much larger than others. 

Usage:

Upon startup the teacher is prompted to enter their name. Successful completion of this task allows for the user to immediately see the meetings that are currently on their schedule. The teacher will see the name of the student, the student's GPA, and the date of the meeting. From there, the teacher has several different options. First, he or she can see some more information about theirself. Then, the teacher can make different types of changes to their schedule. These changes include adding new meeetings, cancelling existing meetings, as well as completely clearing their schedule of meetings. Once the teacher is done with viewing and changing their meetings they can move on to the next menu.

At the following menu, the teacher can make some more changes to their students. The this menu, the teacher is able to do two things: add a student to the club that the teacher runs, or add disciplanary marks against the student's record. The disciplanary marks could allow for teachers/school administrators to keep track of students with behavioral issues and then take actions accordingly. 

Finally, the teacher will be able to reserve rooms. I view this as tool for scheduling club meetings, but it could really be for any purpose that the teacher may need - possibly for setting up group study sessions outside of class, or a department meeting. 

Areas for Improvement: 

Ease of Use: 
This could benefit greatly from implementation of a gem like tty-prompt. As it currently works, there are a few safeguards in place in case the user enters in some information not exactly as expected. For example, if a user enters a name/action with different capitalization than what was expected, the application should be able to adjust so that it will still function. However it seems that a better solution would be to have a menu that the user selects from, which would reduce chaces for typing errors. Generally the program is very easy to break.

Security: 
It would also be prudent to add in a log in procedure. At this point, the program simply requests the name and ID of the user to begin, which is definitely a more primitive level of security. Something like this could be added in but may require additional columns in the teachers database. 

Datatype:
The date columns for both reservations and meetings is currently in string format. This made it easier for me to enter and get things started, but leaves a lot open for weirdness later. One could enter in a date in the past, or really any other string and the functions would create a reservation/meeting out of it. Or a user could enter in a date for a room reservation or student meeting that is not really available. This may be helped by implementing the tty-prompt gem to limit what options could be typed in. Possibly changing the datatype to date, and then having the user still type it out could work as well, but it still seems more complicated than it probably should be.  

Additional Methods:
At a certain point, a more complete application could encompass almost all day-to-day functions for a school. Class scheduling, grade input, teacher-parent communications, and more. Some of these additional features are CRUD-related and would be relatively simple to add in, whereas others would be more advanced and require additional databases.
Specific methods that I would want to continue to add would be as follows: 
First updating the dates column for the meeting/reservation classes. More research would be needed but I am picturing something like a list of every weekday for each month. That could then allow for those days to not show up as available when creating new reservations/meeting. 
It could be interesting to add a function which would look through a student's disciplinary marks, and reassign them to a different club (study hall?) if they reach a certain amount of marks.

Appearance: 
The application is has a basic appearance at this point. Colorization of names and important data has improved readability, but there could be some other interesting/helpful things to do with color. Possible changes could include: changing the color of how a student's name appears based on number of disciplinary marks, or putting some of the more important information in bold characters. I looked at adding some ASCII art but was having a little bit of trouble with adding it - I decided to move on as it should not affect much if it is added later. 

Struggles: 
The most difficulty that I had was in connecting the different actions through the CLI. For example once a user would cancel or create a meeting, I had a very difficult time in figuring out how to get the program to return to that same menu for them to continue with cancelling/creating meetings. In talks with classmates I determined that some of the difficulty may have been avoided by using the tty-prompt gem - since I am not familiar with the gem I could not say that for sure, but it is definitely something to keep in mind for the future. 

It could be that I am missing something simple for the CLI looping, or it may be that a fundamental change is needed to implement the ability to loop back to previous methods (although I am hoping it is the former, and suspect that it may bethe latter)

Side Thoughts:

Using the Faker gem for the student and teacher names made creation of the seed data simpler. However having some students showing up as "Dr...". I was also considering trying to add some sort of Mr/Mrs prefex in front of the teacher's names. After searching through the Faker gem documentation it did not appear to me that there was any way to differentiate what gender the fake names would be, and having the name appear like "Mr/Mrs name" in every instance did not seem like it would make anything better, so I decided to just have the names left without any additional prefixes. It seems that this could be fixed by manually entering all of the information.

