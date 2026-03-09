import socket

SERVER_BLUETOOTH_MAC = "84:14:4D:08:76:1C"
PORT = 4

def start_server():
    server = socket.socket(
        socket.AF_BLUETOOTH,
        socket.SOCK_STREAM,
        socket.BTPROTO_RFCOMM
    )

    try:
        server.bind((SERVER_BLUETOOTH_MAC, PORT))
        server.listen(1)
        
        print("Waiting for Bluetooth client connection...")
        print(f"Server MAC address: {SERVER_BLUETOOTH_MAC}")
        print(f"RFCOMM channel: {PORT}")

        client, addr = server.accept()
        print(f"Connected to: {addr}")

        while True:
            data = client.recv(1024)
            if not data:
                print("Client disconnected.")
                break

            message = data.decode("utf-8")
            print("Received:", message)

    except OSError as e:
        print("Bluetooth server error:", e)

    finally:
        try:
            client.close()
        except:
            pass
        server.close()
        print("Server closed.")


if __name__ == "__main__":
    start_server()
