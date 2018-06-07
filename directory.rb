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
  # get the cohort
  puts "Please enter your cohort"
  cohort = gets.chomp
  # convert to symbol
  cohort.to_sym
  # while the name and country of birth is not empty, repeat this code
  while !name.empty? && !country.empty? && !cohort.empty? do
    # add the student hash to the array
    students << {name: name, country_of_birth: country, cohort: cohort}
    if students.length > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    # get another name and country of birth fron the user
    name = gets.chomp
    country = gets.chomp
    cohort = gets.chomp
    cohort.to_sym
  end
# return the array of students
  students
end
def print_header
  puts "The students of Villain Academy".center(50)
  puts "------------".center(50)
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
# this method prints only students whose name are less than 12 characters
def print_student_with_character_limit(students)
  puts "Student whose name are less than 12 characters:"
  students.each.with_index(1) do |student, index|
    if student[:name].length < 12
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
# this method prints only students in the November cohort
def print_by_cohort(students)
  counter = 0
  puts "Students in November cohort:"
  while counter < students.length do
    students.each.with_index(1) do |student, index|
      if student[:cohort] == "november"
        puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
      else   
        puts "There are no students in the November cohort"
      end
      counter = counter + 1
    end
  end
end
def print_footer(students)
  puts "------------".center(50)
  puts "Overall, we have #{students.count} great students".center(50)
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
puts "------------".center(50)
print_student_one_letter(students)
puts "------------".center(50)
print_student_with_character_limit(students)
puts "------------".center(50)
print_by_cohort(students)
print_footer(students)
