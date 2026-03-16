

# IoT Monitoring System with MQTT and Telegram Alerts

This project extends a simple IoT communication system by adding a **real-time alert mechanism** using Telegram.

When the temperature value received from the sensor exceeds a predefined threshold, the cloud server automatically sends a **Telegram notification**.

This simulates a **cloud monitoring and alerting service**, commonly used in real-world IoT systems.

---

# System Architecture Diagram

The system consists of three main components:

Sensor Node → Edge Device → Cloud Monitoring Server

Communication technologies used:

- TCP Socket Communication
- MQTT Messaging Protocol
- Telegram Bot API

System data flow:

Sensor (Laptop 1)
│
│ Socket Communication
▼
Edge Device (Laptop 2)
│
│ MQTT Publish
▼
MQTT Broker (broker.emqx.io)
│
│ MQTT Subscribe
▼
Cloud Server (Laptop 1)
│
▼
Telegram Alert Notification

---

# System Components

## 1. Sensor Node

The sensor node simulates a temperature sensor.

It generates random temperature values and sends them to the edge device using **TCP socket communication**.

File:

socket_sensor.py

Example output:

Sensor value sent: 23.41
Sensor value sent: 29.30

The sensor sends a new value every **5 seconds**.

---

## 2. Edge Device

The edge device receives the sensor data via socket and forwards the data to the MQTT broker.

File:

edge_device.py

Main tasks of the edge device:

1. Receive temperature data from the sensor
2. Publish the data to the MQTT broker

Example output:

Edge device waiting for sensor...
Sensor connected: ('192.168.204.123', 51233)
Edge received: 29.3
Forwarded to MQTT: 29.3

---

# MQTT Configuration

MQTT broker used:

broker.emqx.io

MQTT topic used:

savonia/iot/temperature

The edge device publishes the sensor temperature to this topic.

The cloud server subscribes to the same topic.

---

# Cloud Monitoring Server

The cloud server subscribes to the MQTT topic and monitors temperature values.

File:

mqtt_alert_subscriber.py

When the received temperature exceeds the threshold value, the system sends a Telegram alert.

Example terminal output:

Temperature: 29.3
ALERT: High temperature 29.3 °C

---

# Telegram Alert System

A Telegram bot is used to send real-time alerts.

Steps to create the Telegram bot:

1. Open Telegram
2. Search for **BotFather**
3. Create a new bot using

/newbot

4. Save the bot token provided by BotFather.

Example:

123456789:ABCDEFxxxxxxx

5. Send a message to the bot.

6. Open in browser:

https://api.telegram.org/botYOUR_TOKEN/getUpdates

Find your **chat id** in the response.

Example:

"chat":{"id":12345678}

The system sends alerts using the Telegram API when the temperature exceeds the threshold.

---

# Telegram Alert Screenshot

Insert a screenshot showing the Telegram message received.

Example Telegram message:

ALERT: High temperature 29.3 °C

Example screenshot file:

screenshots/telegram_alert.png

---

# How the System Works

1. The sensor node generates random temperature values.
2. The sensor sends the temperature data to the edge device using socket communication.
3. The edge device receives the data and publishes it to the MQTT broker.
4. The cloud monitoring server subscribes to the MQTT topic.
5. When the received temperature exceeds the threshold value (28°C), the system sends a Telegram notification.

This architecture simulates a typical **IoT monitoring pipeline with real-time alerts**.

---

# How to Run the System

Run the programs in the following order.

Step 1 — Start the alert subscriber (Laptop 1)

python mqtt_alert_subscriber.py

Step 2 — Start the edge device (Laptop 2)

python edge_device.py

Step 3 — Start the sensor (Laptop 1)

python socket_sensor.py

---

# Expected Result

Terminal output:

Temperature: 29.3
ALERT: High temperature 29.3 °C

Telegram notification:

ALERT: High temperature 29.3 °C

---

# Reflection Question

## Why is MQTT useful for building monitoring and alert systems in IoT?

MQTT is useful for monitoring and alert systems because it provides a lightweight publish/subscribe communication model that is efficient for devices with limited resources.

It allows multiple devices and services to receive data from sensors in real time without direct connections between them.

This architecture improves scalability and reliability because many subscribers can monitor the same data stream. It also allows cloud services to easily trigger alerts, store data, or perform analytics when abnormal conditions are detected.

For IoT monitoring systems, MQTT is widely used because it supports real-time messaging, low bandwidth usage, and flexible integration with cloud platforms.

---

# Repository Structure

iot-telegram-alert-system/

socket_sensor.py
edge_device.py
mqtt_alert_subscriber.py

README.md

screenshots/
telegram_alert.png
