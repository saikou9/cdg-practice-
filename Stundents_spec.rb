require 'rspec'
require_relative './St.rb'

describe 'St' do
  main = St.new
  it 'test filter_students with one student' do
    
    data = []
    data << "Иван Кожухарь 26"
    age = 26
    expect(main.filter_students(age, data)).to eq ["Иван Кожухарь 26"]
  end

  it 'test filter_students with greater then one students' do
    data = []
    data = main.takeData("Students.txt")
    age = 20
    expect(main.filter_students(age, data)).to eq ["Кирилл Чижов 20", "Ростислав Мельников 20"]
  end

  it 'test filter_students with no age matches ' do
    data = []
    data = main.takeData("Students.txt")
    age = 9
    expect(main.filter_students(age, data)).to eq []
  end
end