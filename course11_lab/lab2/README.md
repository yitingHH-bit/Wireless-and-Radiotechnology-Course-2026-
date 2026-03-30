# Multi-Sensor IoT Monitoring System with Socket, MQTT, and Grafana

## Introduction
This project is a simple multi-sensor IoT monitoring system built using socket programming, MQTT, and Grafana.

The system includes two laptops:

- **Laptop 1** works as the sensor node
- **Laptop 2** works as the edge device

Laptop 1 generates simulated sensor data and sends it to Laptop 2 through a TCP socket connection.  
Laptop 2 receives the data, separates the sensor values, and publishes them to different MQTT topics.  
Finally, Grafana on Laptop 1 subscribes to those MQTT topics and displays the values in a live monitoring dashboard.

---

## System Overview
The data flow of the system is shown below:

Sensor Node (Laptop 1)  
→ Socket  
→ Edge Device (Laptop 2)  
→ MQTT Broker  
→ Grafana Dashboard (Laptop 1)

This means the sensor data first moves through socket communication and is then forwarded into MQTT for visualization.

---

## Sensors Used
In this lab, three simulated sensors were used:

1. **Temperature sensor**
   - Simulated range: 20 to 35 °C

2. **Humidity sensor**
   - Simulated range: 40 to 80 %

3. **Light sensor**
   - Simulated range: 100 to 1000 lux

These values are generated randomly in the sensor script every 5 seconds.

---

## MQTT Topics Used
Each sensor value is published to its own MQTT topic:

- `savonia/iot/temperature`
- `savonia/iot/humidity`
- `savonia/iot/light`

Separating the sensors into different topics makes the system easier to organize, monitor, and extend.

---

## MQTT Broker Used
The MQTT broker used in this project is:

- **Broker:** `broker.emqx.io`
- **Port:** `1883`

---

## Files Included
This repository contains the following files:

- `socket_sensor.py`  
  Simulates temperature, humidity, and light sensor values and sends them to Laptop 2 through a socket connection.

- `edge_device.py`  
  Receives the sensor message from Laptop 1, splits the values, and publishes them to separate MQTT topics.

- `README.md`  
  Explains the system structure, MQTT topics, dashboard design, and reflection answer.

---

## How the System Works

### 1. Sensor Node
The sensor node runs on Laptop 1.  
It creates three random sensor values:

- temperature
- humidity
- light

These values are combined into one message in the following format:

```python
temperature,humidity,light