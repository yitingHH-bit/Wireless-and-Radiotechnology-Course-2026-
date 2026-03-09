import socket
import random
import time

SERVER_BLUETOOTH_MAC = "XX:XX:XX:XX:XX:XX"   # Replace with the server device Bluetooth MAC address
PORT = 4

def generate_sensor_data():
    temperature = round(random.uniform(20.0, 30.0), 1)
    return f"Temperature: {temperature} C"


def start_client():
    client = socket.socket(
        socket.AF_BLUETOOTH,
        socket.SOCK_STREAM,
        socket.BTPROTO_RFCOMM
    )

    try:
        print("Connecting to Bluetooth server...")
        client.connect((SERVER_BLUETOOTH_MAC, PORT))
        print("Connected to Bluetooth server")

        while True:
            message = generate_sensor_data()
            client.send(message.encode("utf-8"))
            print("Sent:", message)
            time.sleep(5)

    except OSError as e:
        print("Bluetooth client error:", e)

    finally:
        client.close()
        print("Client closed.")


if __name__ == "__main__":
    start_client()