# 2-23-2016
number = 1
while number < 100
  msg = ""
  if number.modulo(3) == 0
    msg = msg + "Fizz"
  end
  if number.modulo(5) == 0
    msg = msg + "Buzz"
  end
  if msg == ""
    puts number
  else 
    puts msg
  end
  number += 1
end