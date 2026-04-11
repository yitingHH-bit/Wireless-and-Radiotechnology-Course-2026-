# Bluetooth Client–Server Communication using Python

## Project Description

This project implements a simple Bluetooth client–server communication system using Python and RFCOMM sockets.

The server waits for an incoming Bluetooth connection from a client device. Once connected, the client sends randomly generated temperature sensor data to the server every 5 seconds. The server receives the messages and prints them to the terminal.

This simulates a simple IoT scenario where a sensor device transmits data to a central receiver.

---

## Bluetooth MAC Address Used

Server Bluetooth MAC address:

XX:XX:XX:XX:XX:XX  

RFCOMM Channel / Port:

4

Both devices must have Bluetooth enabled and paired before running the program.

---

## How to Run the Program

### Step 1: Run the Server

On the server device, run:

```bash
python server.py

Question:
The main difference is that Bluetooth sockets are used for short-range, paired device communication, while WiFi sockets use IP-based networking for long-range and internet communication.
