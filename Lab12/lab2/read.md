
# 📡 IoT Real-Time Video Streaming Lab
<img width="885" height="722" alt="image" src="https://github.com/user-attachments/assets/22dfc75d-3f48-420e-b822-da54140df184" />

## 📌 Objective
In this lab, we built a simple real-time home monitoring system.

The system performs the following tasks:
- Captures live video from a webcam
- Streams the video over a local network
- Allows another device to view the video in a web browser

This lab demonstrates how real-time video communication works in IoT systems.

---

## 🧠 System Overview

Pipeline:

Camera → Capture → Encode → Stream → Viewer

---

## 💻 Setup

### 👥 Team Roles
- Laptop A (Camera/Sender): [Your Name]
- Laptop B (Viewer/Receiver): [Partner Name]

### 🌐 Network
- Both laptops connected to the same WiFi network

### 📍 Sender IP Address
192.168.xxx.xxx

---

## 📂 Folder Structure

### Sender (Laptop A)
iot_stream_lab/
│── app.py

---

## ⚙️ System Components

### Streaming Server (app.py)
- Captures video from webcam using OpenCV
- Encodes frames as JPEG
- Streams video using Flask
- Provides web interface for viewing

---

## 🚀 How to Run

### Step 1 – Start the Stream (Laptop A)
```bash
python app.py
```

---

### Step 2 – Find IP Address (Laptop A)
```bash
ipconfig
```
Find IPv4 Address (e.g., 192.168.1.20)

---

### Step 3 – Open Stream (Laptop B)

Open browser and enter:
```
http://SENDER_IP:5000
```

---

## ✅ Expected Results

### Sender:
- Webcam starts
- Flask server runs
- Frames captured continuously

### Viewer:
- Browser connects to sender
- Live video displayed
- Stream updates in real time

---

## ⚠️ Issues & Fixes

### Issue: Cannot access stream
- Check same WiFi network
- Verify IP address
- Allow Python in firewall

### Issue: Webcam not working
- Ensure no other app is using camera

---

## 📊 System Evaluation

- Live streaming: Working
- Network access: Working
- Real-time update: Successful

---

## 🎯 Learning Outcomes

- Real-time video streaming in IoT
- Flask-based web streaming
- OpenCV video processing
- Network communication between devices

---

## 🌍 Real-World Applications

- Home monitoring systems
- Baby monitors
- Office surveillance
- Farm monitoring

---

## 🔧 Optional Extension

- Change resolution or frame size
- Measure performance impact
- Add timestamp using OpenCV:
```python
cv2.putText(...)
```

---

## 📌 Conclusion

This lab demonstrates a simple IoT video streaming pipeline using OpenCV and Flask, enabling real-time monitoring over a local network.
