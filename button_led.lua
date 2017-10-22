-- turns on the led if the button is pressed

-- pin numbers
output_pin = 1
input_pin = 2

-- Set GPIO
gpio.mode(output_pin, gpio.OUTPUT)
gpio.mode(input_pin, gpio.INPUT)

status = 0
-- check the button every 2 milisecond
tmr.alarm(0, 2, 1, function()
 -- read the input pin and change the status to remember
 if gpio.read(input_pin) == 1 then
  status = 0
 else
   status = 1
 end
 
 -- change GPIO output
 if status == 1 then
  gpio.write(output_pin, gpio.LOW)
 else
   gpio.write(output_pin, gpio.HIGH)
 end
end)
