pin = 1
gpio.mode(pin, gpio.OUTPUT)
gpio.write(pin, gpio.LOW)
print(gpio.read(pin))
status = 0
tmr.alarm(0, 1000, 1, function()
 if status == 1 then
  gpio.write(pin, gpio.LOW)
  status = 0
 else
   gpio.write(pin, gpio.HIGH)
   status = 1
 end
end)
