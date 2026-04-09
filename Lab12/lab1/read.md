# 📹 IoT Video Pipeline Lab
## over show
<img width="1367" height="787" alt="image" src="https://github.com/user-attachments/assets/f5e40c58-d425-4a42-8945-d02b004f79cb" />

## 📌 Objective
In this lab, we built an automated large-data IoT pipeline on Windows.

The system performs the following tasks:
- Records a short video automatically every 2 minutes
- Saves the video locally
- Sends the video to another laptop over the network
- Waits for confirmation from the receiver
- Deletes the local video only after successful transfer

This lab simulates how real IoT edge devices collect, transmit, and manage large data.

---

## 🧠 System Overview

The pipeline follows this workflow:

Record → Save → Send → Confirm → Delete

---

## 💻 Setup

### 👥 Team Roles
- Laptop A (Sender): [Your Name]
- Laptop B (Receiver): [Partner Name]

### 🌐 Network
- Both laptops connected to the same WiFi network

### 📍 Receiver IP Address
192.168.xxx.xxx

---

## 📂 Folder Structure

### Sender (Laptop A)
iot_video_lab/
│── recorder.py
│── sender.py
│── videos/

### Receiver (Laptop B)
iot_video_lab/
│── receiver.py
│── received_videos/

---

## ⚙️ System Components

### Receiver (receiver.py)
- Listens on port 5001
- Receives video files over TCP
- Saves videos into received_videos/
- Sends confirmation ("OK") after successful reception

### Recorder (recorder.py)
- Captures video from webcam
- Records 10-second videos
- Saves files every 2 minutes
- Stores videos in videos/ folder

### Sender (sender.py)
- Monitors videos/ folder
- Sends video files to receiver
- Waits for confirmation
- Deletes file only after successful transfer

---

## 🚀 How to Run

### Step 1 – Start Receiver (Laptop B)
python receiver.py

### Step 2 – Start Sender System (Laptop A)

Open two terminals:

Terminal 1:
python recorder.py

Terminal 2:
python sender.py

---

## ✅ Expected Results

### Sender:
- Records video every 2 minutes
- Saves video locally
- Sends video automatically
- Deletes file only after confirmation

### Receiver:
- Receives video files
- Saves them in received_videos/
- Sends confirmation back

---

## ⚠️ Issues & Fixes

### Issue: OpenCV not installed
Fix:
python -m pip install opencv-python

---

## 📊 System Evaluation

- Automated recording: Working
- File transfer: Working
- Confirmation mechanism: Working
- File deletion after transfer: Successful

---

## 🎯 Learning Outcomes

- Understanding IoT data pipelines
- Socket-based file transfer
- Reliable communication with confirmation
- Edge device data handling

---

## 📌 Conclusion

This lab demonstrates a complete IoT pipeline from data capture to transmission and cleanup.
