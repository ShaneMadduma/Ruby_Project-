class Grader # class for the a maths teacher
    def initialize (teachers_name)
        @teachers_name = teachers_name #An instance variable
    end

    def start_page # strings only method for the start menu where the user will enter the name
        puts "======================================="
        puts "WELCOME TO THE GRADING SYSTEM TUTOR #{@teachers_name}"
        puts "======================================="
        puts "    "
    end

    def student_marks #student marks method to take the inputs of students
        begin #First exception handler to initiate that the number of students doenst get = to 0
            #becasue 0 cantbe devided by any number and error will pop

            print "Enter the number of students that sat for the Exam :"
            @no_studs =Integer(gets.chomp)
            puts "#{@no_studs} Students Sat for the Exam"
        rescue ArgumentError
            puts "Please enter an Integer"
            puts"Retry..."
            retry #applying retrying so when there is an error it turn back to the place where it left
        end

        x = 0 #counter variable
        @student_grades = {}
        while x < @no_studs #used While loop to calculate to loop through the number of students and enter their names seperately to each person to the dictiory hash

            print "Enter Student Name :"
            stud_name = gets.chomp

            begin

                print "Enter Student Marks :"
                marks = Integer (gets.chomp)

            rescue
                puts "Please enter an Integer"
                puts"Retry..."
                retry
            end
            @student_grades[stud_name.to_sym]=marks #here the student name will be the Key and the Marks will be the values for the key and the name is created to a symbol

            x += 1 # an counter variable is used to make X increment everytime a value is entered
        end
        [@student_grades,@no_studs]
    end

    def calculating_average # this method is used to calculate the average with studentmarks values taken in as sum and diveded by the numberof students
        class_marks= @student_grades.values
        total = class_marks.sum

        average = total / @no_studs
        puts ""
        puts "The Total Average of the class is #{average}"
        puts " "

        case average #Case statement used to check the overall class average like in ACBT
        when 80..100 then puts "Class average is HD"

        when 70..80 then puts "Class average is D"

        when 60..70 then puts "Class average is CR"

        when 50..60 then puts "Class average is C"

        when 0..50 then puts "Class average is Fail"

        end

    end
end

puts""
print "Enter Teachers name:"

teacher = gets.chomp
puts""
run_grader = Grader.new("#{teacher}")

run_grader.start_page

run_grader.student_marks

run_grader.calculating_average()