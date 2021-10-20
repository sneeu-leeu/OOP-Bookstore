require './teacher'
require './student'

class Convertor
 def self.people_h_to_ar(arr)
    i_array = arr.map do | i |
        case i["type"]
        when 'teacher'
        Teacher.new(
            age: i["age"],
            specialization: i["specialization"],
            name: i["name"],
            id: i["id"]
            )
        when 'student'
        Student.new(
            age: i["age"],
            name: i["name"],
            parent_permission: i["parent_permission"],
            id: i["id"]
            )        
        end
    end
    i_array.empty? ? [] : i_array
 end

 def self.hash_to_books_arr(arr)
    instance_arr = arr.map do |item|
      Book.new(item["title"],item["author"])
    end
  end

end