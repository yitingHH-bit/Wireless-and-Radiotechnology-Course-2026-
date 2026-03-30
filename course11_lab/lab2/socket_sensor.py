import socket
import random
import time

SERVER_IP = "192.168.x.x"   # Replace with Laptop 2 IP address
PORT = 5000

def main():
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect((SERVER_IP, PORT))
    print(f"Connected to edge device at {SERVER_IP}:{PORT}")

    try:
        while True:
            temperature = round(random.uniform(20, 35), 2)
            humidity = round(random.uniform(40, 80), 2)
            light = round(random.uniform(100, 1000), 2)

            message = f"{temperature},{humidity},{light}"
            client.send(message.encode())

            print("Sent:", message)
            time.sleep(5)

    except KeyboardInterrupt:
        print("Sensor node stopped.")

    finally:
        client.close()

if __name__ == "__main__":
    main()