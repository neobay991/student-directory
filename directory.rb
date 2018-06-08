@students = []
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  #students = []
  # get the first name. Use the .delete method instead chomp to remove carriage return characters \r\n
  name = gets
  name.delete!("\r\n")
  # get the country of birth. Use the .delete method instead chomp to remove carriage return characters \r\n
  puts "Please enter country of birth"
  country = gets
  country.delete!("\r\n")
  # get the cohort. Use the .delete method instead chomp to remove carriage return characters \r\n
  puts "Please enter your cohort"
  cohort = gets
  cohort.delete!("\r\n")
  # convert to symbol
  cohort.to_sym
  # while the name and country of birth is not empty, repeat this code
  while !name.empty? && !country.empty? && !cohort.empty? do
    # add the student hash to the array
    @students << {name: name, country_of_birth: country, cohort: cohort}
    if @students.length > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    # get another name and country of birth fron the user
    name = gets
    name.delete!("\r\n")
    country = gets
    country.delete!("\r\n")
    cohort = gets
    cohort.delete!("\r\n")
    cohort.to_sym
  end
# return the array of students
  #students
end
def print_header
  puts "The students of Villain Academy".center(50)
  puts "------------".center(50)
end
def print
  counter = 0
  while counter < @students.length do
    @students.each.with_index(1) do |student, index|
        puts "#{student[:name]}, country of birth: #{student[:country_of_birth]} (#{student[:cohort]} cohort)"
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
      end
      counter = counter + 1
    end
  end
end
def print_footer
  puts "------------".center(50)
  if @students.length > 1
    puts "Overall, we have #{@students.count} great students".center(50)
  else
    puts "Overall, we have #{@students.count} great student".center(50)
  end
end
def interactive_menu
  students = []
  loop do
    # 1 print the menu and ask the user what to do
    print_menu
    # 2 read the input and save it into a variable
    selection = gets.chomp
    # 3 do what the user has asked
      case selection
        when "1"
          students = input_students
        when "2"
          show_students
        when "3"
          save_students
        when "9"
          exit # this will cause the program to terminate
        else
          puts "I don't know meant, try again"
      end
    # repeat from step 1
    end
end
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3 Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end
def show_students
  print_header
  print
  print_footer
end
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name] , student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
# nothing happens until we call the methods
interactive_menu
#students = input_students
#print_header
#print(students)
#puts "------------".center(50)
#print_student_one_letter(students)
#puts "------------".center(50)
#print_student_with_character_limit(students)
#puts "------------".center(50)
#print_by_cohort(students)
#print_footer(students)
