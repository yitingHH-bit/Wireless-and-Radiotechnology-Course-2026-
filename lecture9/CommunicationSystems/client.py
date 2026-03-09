import socket

HOST = "192.168.204.243"
PORT = 5000

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print("Server started, waiting for connection...")

conn, addr = server.accept()
print("Connected by", addr)

while True:
    data = conn.recv(1024)
    if not data:
        break

    print("Received:", data.decode())

conn.close()
