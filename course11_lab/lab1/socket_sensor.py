import socket
import time
import random

EDGE_IP = "192.168.1.100"   # change to Laptop 2 IP
EDGE_PORT = 5000

def main():
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect((EDGE_IP, EDGE_PORT))
    print(f"Connected to edge device at {EDGE_IP}:{EDGE_PORT}")

    try:
        while True:
            temperature = round(random.uniform(20.0, 35.0), 2)
            message = str(temperature)
            client.sendall(message.encode("utf-8"))
            print(f"Sent sensor value: {message}")
            time.sleep(2)
    except KeyboardInterrupt:
        print("Sensor stopped.")
    finally:
        client.close()

if __name__ == "__main__":
    main()