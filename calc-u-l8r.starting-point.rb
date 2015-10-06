require 'date'

def get_input(order)
  puts "Enter the #{order} number"
  gets.to_f
end

def add
  a = get_input("1st")
  b = get_input("2nd")
  a+b
end

def subtract
  a = get_input("1st")
  b = get_input("2nd")
  a-b
end

def multiply
  a = get_input("1st")
  b = get_input("2nd")
  a*b
end

def divide
  puts "Don't you dare put 0 in."
  a = 0
  b = 0
  until !(a==0||b==0)
    a = get_input("1st")
    b = get_input("2nd")
    if a==0||b==0
      puts "I too like to live dangerously"
    end
  end
  a/b
end

def power
  a = get_input("1st")
  b = get_input("2nd")
  a**b
end

def square
  a=get_input("1st")
  ans = Math::sqrt(a)
end

def answer(ans)
  puts "As Mia Wallace says; don't be a square...but in this case here you go. The answer is: #{ans}"
end

def menu
  # Clear the screen, and present the user with a menu
  puts `clear` # Backticks run things directly in the terminal
  puts "*** Calc-U-L8R ***"
  puts "Welcome to the Calculator of yesterday...TODAY!! 

  Please choose whether to keep it simple, or push the boundaries."
  print "a(g)e, (b)asic, (a)dvanced, (c)hristmascountdown, (v)olumecalculator or (q)uit: "
  gets.chomp.downcase
end

def return_to_main
  puts "Press enter to continue."
  gets
end


def basic_calc
  # ask the user which operation they want to perform
  puts "K.I.S.S. Keep it simple, stupid"
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
  case operation
  when "a"
    answer(add)
  when "s"
    answer(subtract)
  when "m"
    answer(multiply)
  when "d"
    answer(divide)
  end
end

def advanced_calc
  #nothing here yet, add power and square root
  puts "Everthing is cooler with advanced added to it. Like orama or mania."
  print "(p)ower up, or be a (s)quare? "
  operation = gets.chomp.downcase
  case operation
  when 'p'
    answer (power)
  when 's'
    answer (square)
    sleep 10
  end
end

def age
  print "What year were you born?"
  year_of_birth = gets.to_i
  print "In what month were you born?"
  birth_month = gets.to_i
  print "On what day were you born?"
  day_of_birth = gets.to_i
  time_of_birth = Time.new(year_of_birth, birth_month, day_of_birth)
  puts "time of birth #{time_of_birth}"
  today = Time.new()
  seconds_alive = today - time_of_birth
  puts "seconds alive #{seconds_alive}"
  seconds_in_year = 365.25 * 24 * 60 * 60
  years_alive = (seconds_alive/seconds_in_year).to_i
  puts "you are #{years_alive} years young"
  sleep 10
end

def christmascountdown

  require 'date'

  day = ARGV[0].to_i
  month = ARGV[1].to_i
  year = ARGV[2].to_i

  target = Date.new(2015, 12, 25)
  today = Date.today

  result = target - today
  puts "#{result.to_i} days to go!"
  sleep 10
end

def volumecalculator
  puts "Choose your poison"
  print "Volume of a (c)one, c(u)be or (s)phere "
  operation = gets.chomp.downcase

  case operation
  when 'c'
    answer(cone)
  when 's'  
    answer(sphere)
  when 'u'
    answer(cube)
  end

  return_to_main
end

def answer(ans)
    puts "The answer is: #{ans}"
end

def return_to_main
  puts "Press enter to continue"
  gets
end

def cone
  puts "Enter the Radius"
  radius = gets.to_f
  puts "Enter the Height"
  height = gets.to_f
  (3.14159*radius**2*height)/3
end

def cube
  puts "Enter the Length of a Side"
  side = gets.to_f
  side**3
end

def sphere
  puts "Enter the Radius"
  radius = gets.to_f
  1.33*(3.14159*radius**3)
end
# run the app...

response = menu

until response == 'q'
  case response
  when 'v'
    volumecalculator
  when 'c'
    christmascountdown
  when 'g'
    age
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  else
    puts "Please use a or c or b or g or v to choose an option, or press q to quit. Go in my peace, my child."
    return_to_main
  end

  response = menu
end