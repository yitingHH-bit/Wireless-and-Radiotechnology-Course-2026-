import socket
import paho.mqtt.client as mqtt

SOCKET_HOST = "0.0.0.0"
SOCKET_PORT = 5000

MQTT_BROKER = "broker.emqx.io"
MQTT_PORT = 1883
MQTT_TOPIC = "savonia/iot/temperature"

def main():
    mqtt_client = mqtt.Client()
    mqtt_client.connect(MQTT_BROKER, MQTT_PORT, 60)
    print(f"Connected to MQTT broker: {MQTT_BROKER}:{MQTT_PORT}")

    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((SOCKET_HOST, SOCKET_PORT))
    server.listen(1)
    print(f"Socket server listening on {SOCKET_HOST}:{SOCKET_PORT}")

    conn, addr = server.accept()
    print(f"Connected by sensor: {addr}")

    try:
        while True:
            data = conn.recv(1024)
            if not data:
                break

            value = data.decode("utf-8").strip()
            print(f"Received from socket: {value}")

            mqtt_client.publish(MQTT_TOPIC, value)
            print(f"Published to MQTT topic {MQTT_TOPIC}: {value}")
    except KeyboardInterrupt:
        print("Edge device stopped.")
    finally:
        conn.close()
        server.close()
        mqtt_client.disconnect()

if __name__ == "__main__":
    main()