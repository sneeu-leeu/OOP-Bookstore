class Creator
  def self.student
    print 'Age: '
    age_response = gets.chomp.to_i

    print 'Name: '
    name_response = gets.chomp

    print 'Has Parent Permission? [Y/N]: '
    permission_response = gets.chomp.downcase == 'y'

    student = Student.new(age: age_response, name: name_response, parent_permission: permission_response,
                          classroom: @classroom)

    puts "Student #{name_response} created succesfully"

    student
  end

  def self.teacher
    print 'Age: '
    age_response = gets.chomp.to_i

    print 'Name: '
    name_response = gets.chomp

    print 'Specialization: '
    specialization_response = gets.chomp

    teacher = Teacher.new(age: age_response, name: name_response, specialization: specialization_response)

    puts "Teacher #{teacher.name} created successfully"

    return teacher
  end

  def self.book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)

    puts "Book: '#{book.title}' created successfully"

    return book
  end

  def self.rental(books, people)
    puts 'Select a Book from the Following list by number'
    books.each_with_index { |book, i| puts "#{i} Title: #{book.title}, Author: #{book.author}" }

    book_i = gets.chomp.to_i

    puts 'Select a Person from the following list by number (NOT ID)'
    people.each_with_index { |person, i| puts "#{i} Name: #{person.name}, Age: #{person.age}" }

    person_i = gets.chomp.to_i

    puts
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, books[book_i], people[person_i])
    
    puts "Book rented successfully"

    rental  
  end
end
