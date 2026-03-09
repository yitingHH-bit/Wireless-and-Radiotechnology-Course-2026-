import socket

HOST = "127.0.0.1"   # Listen on localhost
PORT = 5000          # Port number

def start_server():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        server_socket.bind((HOST, PORT))
        server_socket.listen(1)

        print(f"Server is listening on {HOST}:{PORT} ...")
        conn, addr = server_socket.accept()

        with conn:
            print(f"Connected by {addr}")

            while True:
                data = conn.recv(1024)
                if not data:
                    print("Client disconnected.")
                    break

                message = data.decode("utf-8")
                print(f"Received: {message}")


if __name__ == "__main__":
    start_server()