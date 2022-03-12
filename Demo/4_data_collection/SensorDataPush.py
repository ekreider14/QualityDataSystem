import RPi.GPIO as GPIO
import dht11
import socket
import mysql.connector

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.cleanup()

mydb = mysql.connector.connect(
  host="192.162.0.6",
  user="WebUser",
  password="WebUser",
  database="TempData"
)

instance = dht11.DHT11(pin = 14)
result = instance.read()
hostname = socket.gethostname()

mycursor = mydb.cursor()

sql = "Insert into sensorrecords (temperature, humidity, sensorID) values (%s, %s, %s)"
val = (result.Temperature, result.Humidity, hostname)

mycursor.execute(sql, val)

mydb.commit()

