-- error there is no log fucntion

B = 4275
R0 = 100000
temperature = 0
delay = 10
sample_number = 3
counter = 0
value = 0
cel = 0
sensor_pin = 0

function calculate (analog_value)
 R = 1023.0/analog_value-1.0
 R = R0*R
 temperature = 1.0/(log(R/R0)/B+1/298.15)-273.15
 return temperature
end

tmr.alarm(0, delay, 1, function()
 value = value + adc.read(sensor_pin)
 counter = counter + 1
 if counter == sample_number then
  value = value / sample_number
  cel = calculate (value)
  print(cel)
  counter = 0
  value = 0
 end
end)
