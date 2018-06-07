def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    # increment the counter so we can input a number before the name of each student
    puts "Now we have #{students.count} students"
    # get another name fron the user
    name = gets.chomp
  end
# return the array of students
  students
end
def print_header
  puts "The students of Villain Academy"
  puts "------------"
end
def print(students)
  students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_student_one_letter(students)
  students.each.with_index(1) do |student, index|
    if student[:name][0] == "a"
      puts "------------"
      puts "#{index}. Student names beginning with the letter 'A' - #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_student_one_letter(students)
print_footer(students)
