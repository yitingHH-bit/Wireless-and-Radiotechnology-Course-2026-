jack hou 
# change the PWD of Grafana, user name is  admin,http://localhost:3000
<img width="942" height="922" alt="image" src="https://github.com/user-attachments/assets/7cca6397-44fd-4fec-8afe-423607561246" />
# IoT Real-Time Monitoring with Socket, MQTT, and Grafana
<img width="1717" height="808" alt="image" src="https://github.com/user-attachments/assets/69b4ee48-f900-4260-af24-37f989992979" />
#  run  laptop 2 , edge_device.py
<img width="1510" height="1052" alt="image" src="https://github.com/user-attachments/assets/08c0d206-e6cb-4de3-bc43-ada26920ee3f" />
#  run the Laptop 1  , socket_sensor.py
<img width="1137" height="957" alt="image" src="https://github.com/user-attachments/assets/b31688e0-080b-437f-ae0d-f370e7ce78ea" />
#  run laptop 2 , mqtt_subscriber.py
<img width="1771" height="1063" alt="image" src="https://github.com/user-attachments/assets/3bf84767-29f3-4fc6-ae31-9af413a1c5e0" />
and dashboard
<img width="1390" height="763" alt="image" src="https://github.com/user-attachments/assets/661663e4-b6b9-4173-81a3-c11129d06c3b" />

## 1. System Description
This project demonstrates a simple IoT pipeline with real-time monitoring.

- Laptop 1 acts as a sensor device.
- It sends sensor values to Laptop 2 using socket programming.
- Laptop 2 acts as an edge device.
- Laptop 2 forwards the received values to an MQTT broker.
- Laptop 1 subscribes to the same MQTT topic again.
- Grafana on Laptop 1 visualizes the incoming MQTT data in real time.

## 2. Data Flow
Laptop 1 (Sensor)  
→ Socket  
→ Laptop 2 (Edge Device)  
→ MQTT Publish  
→ MQTT Broker  
→ MQTT Subscribe  
→ Laptop 1 (Subscriber + Grafana Dashboard)

## 3. Files in This Repository
- `socket_sensor.py`: sends simulated sensor data from Laptop 1 to Laptop 2 using socket programming
- `edge_device.py`: receives socket data and publishes it to the MQTT broker
- `mqtt_subscriber.py`: subscribes to the MQTT topic and prints received values for verification

## 4. MQTT Configuration
- **Broker used:** `broker.emqx.io`
- **Port used:** `1883`
- **MQTT topic used:** `savonia/iot/temperature`
<img width="820" height="426" alt="image" src="https://github.com/user-attachments/assets/3febdec1-f312-448e-b0d1-b0b56a3cfc15" />

9. Limitation of the MQTT Visualization

The Grafana MQTT data source supports live monitoring only.
It does not store historical data by itself.
If historical visualization is needed, a storage backend such as Loki or InfluxDB must be added.

10. Reflection Questions
What is the role of Grafana in this system?

Grafana is used as a real-time monitoring dashboard. It visualizes the MQTT data stream so the user can observe sensor values live in the browser.

Why is MQTT useful for monitoring applications?

MQTT is lightweight and efficient. It is suitable for IoT and monitoring systems because it supports publish/subscribe communication and works well for sending small real-time messages.

What is the difference between live monitoring and historical storage?

Live monitoring shows the latest incoming data instantly as it arrives.
Historical storage keeps old data so users can review trends, compare previous values, and analyze the system over time.
