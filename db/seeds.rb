# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

School.create(name: "Harvard", lat: 42.3744, long: 71.1169)
School.create(name: "San Francisco State", lat: 37.7762513, long: -122.4167688)

Report.create(title: "Aggressive Catcalling", description: "A group of men loitering on the corner of Junipero Serra Blvd and Holloway made a lot of comments that made me feel unsafe", lat: 37.721710, long: -122.4722196)
Report.create(title: "Possibly Roofied At a Party", description: "I was at a house party with a friend and started feeling weird after another student got me a drink. I told my friend I was feeling weird and she called us a Lyft and got me home safely, but that was a close call.", street_number:1650, street_name:"Holloway Ave", city:"San Francisco", state:"CA", zip_code: 94132)
Report.create(title: "Groped By Another Student!!!!", description: "When I was walking to the gym a guy passed by and grabbed my butt. I looked back in disgust and he winked. Gross! I've never seen him before, but he was definitely a student here -- I saw he had a school idea in his pocket", lat: 37.722508, long: -122.483220)
Report.create(title: "Frat Guys In This Dorm Make Transphobic Jokes", description: "I'm a cisgendered woman, but I passed a group of football players and I overheard them making offensive jokes about Caitlyn Jenner and other transgender women. It made me uncomfortable, but because there were so many of them I was afraid to say something.", lat: 37.725147, long: -122.479733)
Report.create(title: "Followed By A Creeper", description: "Walking home late after work study and I kept having the feeling I was being followed. I went to 19th Ave so I could be on a more crowded street but watch out if you're on Lyndhurst alone at night. Creepy!", lat: 37.724349, long: -122.473918)
Report.create(title: "My Friend Was Assaulted, Stay Away From Here", description: "I won't go into detail to protect my friends anonymity, but basically if you're a woman STAY FAR FAR AWAY FROM HERE. The university should really do something about the people that live here.", lat: 37.717051, long: -122.481621)
Report.create(title: "Called A Whore On the Street", description: "Some dude yelled 'You're a whore!' when I wouldn't smile for him.", lat: 37.719461, long: -122.476407)
Report.create(title: "Car Full of Guys Honked At Me While I Crossed the Street", description: "They were yelling and making obscene gestures, where's campus safety when you need them?", lat: 37.719809, long: -122.483552)
Report.create(title: "Boob Grabbed At a Party (Who Does That?!)", description: "This definitely wasn't an accident. All his friends just laughed at me when I tried to push him off.", lat: 37.716852, long: -122.476226)
Report.create(title: "Straight Up Stalked", description: "He wouldn't stop following me.", lat: 37.721387, long: -122.474245)



ReportType.create(report_id: 1, type_id: 1)
ReportType.create(report_id: 2, type_id: 5)
ReportType.create(report_id: 3, type_id: 4)
ReportType.create(report_id: 4, type_id: 6)
ReportType.create(report_id: 5, type_id: 3)
ReportType.create(report_id: 6, type_id: 7)
ReportType.create(report_id: 7, type_id: 1)
ReportType.create(report_id: 8, type_id: 1)
ReportType.create(report_id: 9, type_id: 4)
ReportType.create(report_id: 10, type_id: 3)


Type.create(title: "Verbal")
Type.create(title: "Physical")
Type.create(title: "Stalking")
Type.create(title: "Groping")
Type.create(title: "Date Rape")
Type.create(title: "Transphobic")
Type.create(title: "Assault")
