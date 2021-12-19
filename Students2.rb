
def init
  students = []
  File.foreach(STUDENTS_LIST_PATH) { |line| students.push(line.chomp) }
end

def index
  File.foreach(STUDENTS_LIST_PATH) { |student| puts student }
end

def where(age)
  @result_filter = []
  File.foreach(STUDENTS_LIST_PATH).with_index do |student, index|
    @result_filter << student.delete("\n") if student.delete("\n").end_with?(age)

  end
  @result_filter
end


def update(id, name)
  file = File.open(BUFFER, 'w')
  File.foreach(STUDENTS_LIST_PATH).with_index do |student, index|
    file.puts(id == index ? name : student)
  end

  file.close
  File.write(STUDENTS_LIST_PATH, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def controller
  flag = true

  while flag do
    puts "\nВведите желаемый возраст: \n(Для выхода напишите -1)"
    age = gets.chomp

    if age == "-1"
      puts "Выходим..."
      flag = false
      break
    end

    File.open("results.txt", "w") { |f| f.write where(age) } if File.exists?("result.txt")

    if where(age) == []
      puts "\nНет студентов с заданным возрастом!"
    else
      puts "\nСписок 'results.txt' успешно обновлен: \n#{where(age)}"

    end
  end
end


STUDENTS_LIST_PATH = 'Students.txt'
BUFFER = 'buffer.txt'
controller

