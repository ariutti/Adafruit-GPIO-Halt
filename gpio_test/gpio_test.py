#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

PINS = [21, 16]

GPIO.setmode(GPIO.BCM)

for pin in PINS:
	GPIO.setup( pin, GPIO.IN, pull_up_down=GPIO.PUD_UP )


try:
	while(1):
		#read pins
		values = [GPIO.input(pin) for pin in PINS]
		print( values )
		time.sleep(0.25)
		
except:
	print("cleanup")
	GPIO.cleanup()
