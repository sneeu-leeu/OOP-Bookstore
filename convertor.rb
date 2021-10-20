require_relative 'teacher'
require_relative 'student'
require_relative 'book'

class Convertor
  def self.people_h_to_ar(arr)
    i_array = arr.map do |i|
      case i['type']
      when 'Teacher'
        Teacher.new(
          age: i['age'],
          specialization: i['specialization'],
          name: i['name'],
          id: i['id']
        )
      when 'Student'
        Student.new(
          age: i['age'],
          name: i['name'],
          parent_permission: i['parent_permission'],
          id: i['id']
        )
      end
    end
    i_array.empty? ? [] : i_array
  end

  def self.hash_to_books_arr(arr)
    instance_arr = arr.map do |item|
      Book.new(
        item['title'],
        item['author']
      )
    end
  end

  def self.rentals_h_to_r(arr, _books, people)
    i_arr = []
    arr.each do |l|
      people.each do |p|
        i_arr << Rental.new(l['date'], Book.new(l['title'], l['author']), p) if l['person-id'] == p.id
      end
    end
    i_arr
  end
end
