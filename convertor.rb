require './teacher'
require './student'

class Convertor
 def self.people_h_to_ar(arr)
    i_array = arr.map do | i |
    case i["type"]
    when 'teacher'
        Teacher.new(
            id: i["id"],
            age: i["age"],
            name: i["name"],
            specialization: i['specialization']
        )
    when 
        
    else
        
    end
    end
end
end