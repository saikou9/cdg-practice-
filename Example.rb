puts "Введите имя: "
name = gets.chomp
puts "Введите фамилию: "
lastname = gets.chomp
puts "Введите возраст: "
age = gets.to_i

Greeting.greeting(name, lastname, age)
puts Foobar.foobar(20, 1, 3)
