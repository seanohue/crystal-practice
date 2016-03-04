#3-4-2016
Range.new(1, 100).each do |n|
  msg = ""
  if n.modulo(3) == 0
    msg = msg + "Fizz"
  end
  if n.modulo(5) == 0
    msg = msg + "Buzz"
  end
  if msg == ""
    puts n
  else 
    puts msg
  end
end
