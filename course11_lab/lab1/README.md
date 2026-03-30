# IoT Real-Time Monitoring with Socket, MQTT, and Grafana

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

## 5. How to Run

### On Laptop 2
```bash
python edge_device.py