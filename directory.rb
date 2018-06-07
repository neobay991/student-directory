def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # get the country of birth
  puts "Please enter country of birth"
  country = gets.chomp
  # while the name and country of birth is not empty, repeat this code
  while !name.empty? && !country.empty? do
    # add the student hash to the array
    students << {name: name, country_of_birth: country, cohort: :november}
    # increment the counter so we can input a number before the name of each student
    puts "Now we have #{students.count} students"
    # get another name and country of birth fron the user
    name = gets.chomp
    country = gets.chomp
  end
# return the array of students
  students
end
def print_header
  puts "The students of Villain Academy"
  puts "------------"
end
def print(students)
  counter = 0
  while counter < students.length do
    students.each.with_index(1) do |student, index|
        puts "#{student[:name]} , Country of birth: #{student[:country_of_birth]} (#{student[:cohort]} cohort)"
        counter = counter + 1
    end
  end
end
# this method  prints only students whose name begins with the letter A
def print_student_one_letter(students)
  puts "Student names beginning with the letter 'A':"
  students.each.with_index(1) do |student, index|
    if student[:name][0] == "a"
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
# this method  prints only students whose name are less than 12 characters
def print_student_with_character_limit(students)
  puts "Student whose name are less than 12 characters:"
  students.each.with_index(1) do |student, index|
    if student[:name].length < 12
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
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
puts "------------"
print_student_one_letter(students)
puts "------------"
print_student_with_character_limit(students)
print_footer(students)
