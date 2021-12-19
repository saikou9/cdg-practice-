class Greeting
  # статический метод, который будет возвращать текст в зависимости от возраста
def self.greeting(name, lastname, age)
  # проверка на возраст
  if (age < 18)
    answer = "Привет, #{name} #{lastname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    return answer
  elsif answer =  "Привет, #{name} #{lastname}. Самое время заняться делом"
    return answer
  end
end
  end

class Foobar
  # 2 числа сравниваются с 20, если одно из чисел = 20, то возвращается другое число, иначе возвращается их сумма
def self.foobar(a, b)
  if a == 20
    b
  elsif b == 20
    a
  else
    a+b
  end
end
  end

puts "Введите имя: "
name = gets.chomp
puts "Введите фамилию: "
lastname = gets.chomp
puts "Введите возраст: "
age = gets.to_i

puts Greeting.greeting(name, lastname, age)
puts Foobar.foobar(20, 1, 3)

