class Main
def init(balance)

  loop do

    print "\nВведите: 'D' для внесения наличных \nВведите: 'W' для вывода наличных 
    \nВведите: 'B' для проверки счета \nВведите: 'Q' для выхода \n"
    verb = gets.chomp.upcase
    break if verb == "Q"

    if !verb.nil?
      case verb

      when "D"

        puts "Введите сумму пополнения: "
        depos = gets.chomp

        balance = deposit(balance, depos.to_i) if check(depos) && more_then_zero(depos)#rescue (puts "Число не может быть строковым!")

      when "W"

        puts "Введите сумму: "
        withdr = gets.to_i

        balance = withdrawal(balance, withdr.to_i) if check(withdr) && more_then_zero(withdr) && more_then_balance(balance, withdr)

      when "B"

        balance_check(balance)

      end
    end
  end
  File.open("log.txt", "w") { |f| f.write balance }
end

def more_then_balance(balance, value)

  if value.to_i > balance
    puts "Запрос на вывод средств не может превышать сумму баланса!"
    false
  else
    true
  end

end

def check(value)
  #true if value =~ /\A\d+\Z/ rescue false
  if value.to_s =~ /\A\d+\Z/
    true
  else
    puts "Число не может быть строковым!"
    false
  end
end

def more_then_zero(value)
  #true if value.to_i > 0 rescue false
  if value.to_i > 0
    true
  else
    puts "Число должно быть больше нуля!"
    false
  end
end


def deposit(balance, depos)

  balance += depos
  balance_check(balance)
  balance
end


def withdrawal(balance, withr)

  balance -= withr
  balance_check(balance)
  balance

end
end


def balance_check(balance)
  puts "\nБаланс равен: #{balance}"
end




class Bank

DEFAULT_BALANCE = 100

if File.exists?("balance.txt")
  balance = Integer(File.read("balance.txt"))
else
  balance = DEFAULT_BALANCE
end

balance = Integer(File.read("balance.txt")) || DEFAULT_BALANCE

main = Main.new
main.init(balance)

end

#puts Bank()