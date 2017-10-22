#calculation doesn't work

sensor_pin = 0
value = 0
counter = 0
sample_number = 3
delay = 10
temperatureF = 0
temperatureC = 0
voltage = 0

function calculate (analog_value)
 voltage = analog_value * 3.3;
 voltage = voltage/1024;
 print(voltage)
 temperatureC = (voltage - 0.5) * 100
 print(temperatureC)
 temperatureF = (temperatureC * 9 / 5) + 32
 print (temperatureF)
 return temperatureF
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
