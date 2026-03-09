import socket
import random
import time

HOST = "127.0.0.1"   # Server IP address
PORT = 5000          # Server port


def generate_sensor_data():
    temperature = round(random.uniform(20.0, 30.0), 1)
    return f"Temperature: {temperature} C"


def start_client():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client_socket:
        client_socket.connect((HOST, PORT))
        print(f"Connected to server at {HOST}:{PORT}")

        while True:
            message = generate_sensor_data()
            client_socket.sendall(message.encode("utf-8"))
            print(f"Sent: {message}")
            time.sleep(5)

if __name__ == "__main__":
    start_client()