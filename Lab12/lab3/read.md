# 🤖 IoT Intelligent Home Monitoring Lab (YOLO + Streaming)
<img width="1137" height="648" alt="image" src="https://github.com/user-attachments/assets/608e12e2-a075-482d-9204-319cf1efbd4a" />

## 📌 Objective
In this lab, we built a simple intelligent home monitoring system.

The system performs the following tasks:
- Receives a live video stream from another laptop
- Processes the stream in real time
- Runs YOLO object detection on each frame
- Displays detection results with bounding boxes

This lab demonstrates how AI can be integrated into real-time IoT video systems.

---

## 🧠 System Overview

Pipeline:

Camera → Stream → AI Processing → Detection Result

---

## 💻 Setup

### 👥 Team Roles
- Laptop A (Camera / Sender): 
- Laptop B (AI Node / Receiver):

### 🌐 Network
- Both laptops connected to the same WiFi network

### 📍 Sender IP Address
192.168.xxx.xxx

### 🔗 Stream URL
http://SENDER_IP:5000/video_feed

---

## 📂 Folder Structure

### Laptop A (Sender)
iot_stream_lab/
│── app.py

### Laptop B (Receiver)
iot_ai_lab/
│── yolo_stream.py

---

## ⚙️ System Components

### 1️⃣ Streaming Server (app.py)
- Captures webcam video using OpenCV
- Encodes frames as JPEG
- Streams video using Flask
- Provides HTTP endpoint for live streaming

---

### 2️⃣ YOLO Detection Client (yolo_stream.py)
- Connects to video stream via URL
- Uses YOLOv8 model (ultralytics)
- Processes each frame in real time
- Displays detection results with bounding boxes

---

## 🚀 How to Run

### Step 1 – Start Streaming (Laptop A)
```bash
python app.py
```

---

### Step 2 – Find IP Address (Laptop A)
```bash
ipconfig
```
Example:
192.168.1.20

---

### Step 3 – Run YOLO Detection (Laptop B)
```bash
python yolo_stream.py
```

---

## ✅ Expected Results

### Laptop A:
- Webcam captures live video
- Flask server streams video continuously

### Laptop B:
- Stream is received successfully
- YOLO detects objects in real time
- Bounding boxes and labels are displayed
- Processed video shown in a window

---

## 🔍 Detection Results

Example detected objects:
- Person
- Chair
- Laptop
- Phone

(Modify based on your actual test results)

---

## ⚠️ Issues & Fixes

### Issue: Cannot open stream
- Check IP address and URL
- Ensure both devices are on same WiFi

### Issue: YOLO model not loading
Fix:
```bash
python -m pip install ultralytics
```

### Issue: Webcam not working
- Close other applications using camera

---

## 📊 System Evaluation

- Video streaming: Working
- Stream reception: Working
- YOLO detection: Working
- Real-time processing: Successful

---

## 🎯 Learning Outcomes

- Real-time video streaming using Flask
- AI-based object detection using YOLO
- Integration of IoT and AI systems
- Network-based data processing pipelines

---

## 🌍 Real-World Applications

- Smart home monitoring systems
- Intelligent baby monitors
- Warehouse surveillance
- Security and safety monitoring

---

## 🔧 Optional Extension

Print detected object information:
```python
for result in results:
    print(result.boxes)
```

---

## ⭐ Bonus Task

Save image when a person is detected:

Example:
person_detected_01.jpg

---

## 📌 Conclusion

This lab demonstrates an AI-enabled IoT system:

> Camera → Network Stream → AI Processing → Detection Output

It combines real-time streaming with intelligent analysis, similar to modern smart monitoring systems.

