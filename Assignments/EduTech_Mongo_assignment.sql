use EduTech
db.courses.insertMany(
    [
        {
            course_name: "Innogeeks Bootcamp",
            admin: "Mayur",
            sessions: 25,
            assignments: 10 
        },
        {
            course_name: "Web D for Beginners",
            admin: "Lakshya",
            sessions: 10,
            assignments: 4 
        },
        {
            course_name: "Intro to Python",
            admin: "Sachin",
            sessions: 7,
            assignments: 3 
        },
        {
            course_name: "MySql",
            admin: "Nitin",
            sessions: 5,
            assignments: 1 
        }
    ]
)


db.students.insertMany(
    [
        {
            firstname: "Sachin",
            lastname: "Gupta",
            emailId: "sachin@google.com",
            enrolled_courses: ["Innogeeks Bootcamp","MySql"]
        },
        {
            firstname: "Lakshya",
            lastname: "Akar",
            emailId: "lakshya@google.com",
            enrolled_courses: ["Innogeeks Bootcamp","MySql","Intro to Python","Web D for Beginners"]
        },
        {
            firstname: "Dilip",
            lastname: "Jain",
            emailId: "dilip@google.com",
            enrolled_courses: ["Intro to Python","Web D for Beginners"]
        },
        {
            firstname: "Nitin",
            lastname: "Shah",
            emailId: "nitin@google.com",
            enrolled_courses: ["MySql","Web D for Beginners"]
        }
    ]
)

db.students.insertMany(
    [
        {
            firstname: "Sachin",
            lastname: "Gupta",
            emailId: "sachin1@google.com",
            enrolled_courses: ["MySql"]
        },
        {
            firstname: "Nitin",
            lastname: "Shah",
            emailId: "nitin@google.com",
            enrolled_courses: ["MySql","Web D for Beginners"]
        }
    ]
)

db.students.deleteMany(
    {firstname : "Sachin"}
)

db.students.deleteOne(
    {firstname : "Nitin"}
)

db.students.updateMany(
    {firstname : "Sachin"},
    {$set: {firstname: "Nitin"}}
)

db.students.updateMany(
    {firstname : "Sachin"},
    {$set: {firstname: "Nitin"}},
    {upsert : true} 
)

