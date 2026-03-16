
# Lab Series: From Sockets to MQTT in IoT Systems

This project implements a small IoT communication pipeline using Python.  
The system simulates three typical components of an IoT architecture:

- Sensor Node  
- Edge Device  
- Cloud / Server Application  

The goal of this lab is to understand how data flows from a sensor device to the cloud using different communication technologies.

Technologies used:

- Python Socket Programming
- MQTT Messaging Protocol
- Edge Computing Concept

---

# System Architecture Diagram

The experiment uses **two laptops**.

Laptop 1 acts as:
- Sensor Node
- Cloud Subscriber

Laptop 2 acts as:
- Edge Device

Data Flow:

Sensor (Laptop 1)  
↓ Socket Communication  
Edge Device (Laptop 2)  
↓ MQTT Publish  
MQTT Broker (broker.emqx.io)  
↓ MQTT Subscribe  
Cloud Server (Laptop 1)

---

# System Components

## 1. Sensor Node (Laptop 1)

The sensor node simulates a temperature sensor.

It generates random temperature values and sends them to the edge device using **TCP socket communication**.

File:

socket_sensor.py

Example output:

Sensor value sent: 23.41  
Sensor value sent: 24.03

---

## 2. Edge Device (Laptop 2)

The edge device receives sensor data through a socket connection and forwards the same data to the MQTT broker.

File:

edge_device.py

Functions:

1. Receive temperature data from the sensor
2. Publish the received data to the MQTT broker

Example output:

Edge device waiting for sensor...  
Sensor connected: ('192.168.204.123', 53211)  
Edge received: 23.41  
Forwarded to MQTT: 23.41

---

## 3. Cloud Server (Laptop 1)

The cloud server subscribes to the MQTT topic and prints received sensor data.

File:

mqtt_subscriber.py

Example output:

Cloud received: 23.41  
Cloud received: 24.03

---

# IP Addresses Used

The system communicates within a local network.

Example configuration:

Sensor Laptop (Laptop 1)

192.168.204.123

Edge Device Laptop (Laptop 2)

192.168.xxx.xxx

Socket configuration example:

SERVER_IP = "192.168.204.123"  
PORT = 5000

---

# MQTT Configuration

Public MQTT broker used:

broker.emqx.io

MQTT topic used:

savonia/iot/temperature

The edge device publishes sensor data to this topic and the cloud server subscribes to the same topic.

---

# Socket Communication Screenshot

screenshots/lab1.jpg

# MQTT Communication Screenshot

screenshots/lab2.jpg
---
# Full IoT Pipeline

screenshots/lab3.jpg
---

# How to Run the System

Step 1 — Start the Edge Device (Laptop 2)

python edge_device.py

Step 2 — Start the Sensor Node (Laptop 1)

python socket_sensor.py

Step 3 — Start the MQTT Subscriber (Laptop 1)

python mqtt_subscriber.py

---

---


# Future Improvements

Possible extensions:

- Temperature threshold detection
- Real‑time alerts
- Telegram notifications
- Data visualization dashboard
