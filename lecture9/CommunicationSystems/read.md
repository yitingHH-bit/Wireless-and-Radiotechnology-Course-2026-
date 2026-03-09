
# TCP Client-Server Communication in Python

## Project Description
This project demonstrates a simple TCP client-server communication system using Python sockets.

- The **server** runs on localhost (`127.0.0.1`) and waits for a client connection.
- The **client** connects to the server and sends random sensor-like temperature data every 5 seconds.
- The server receives and prints the incoming messages.

Example message:
Temperature: 23.5 C

---

## Files
- `server.py` - TCP server
- `client.py` - TCP client
- `README.md` - project documentation

---

## How to Run

### 1. Start the server
Open a terminal and run:

```bash
python server.py
