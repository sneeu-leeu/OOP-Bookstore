require 'json'

file = File.open("try.json")
# file.close

data_file= JSON.parse(file.read())

# data_file<< gets.chomp

puts data_file

# File.write("try.json",JSON.generate(data_file))
# file = File.open("try.json")
# data_file2= file.read()
# print data_file2

# File.write("try.json",JSON.generate({mesage: data_file}), mode: "a")