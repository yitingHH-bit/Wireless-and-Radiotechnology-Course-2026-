import socket
import paho.mqtt.client as mqtt

HOST = "0.0.0.0"
PORT = 5000

BROKER = "broker.emqx.io"
BROKER_PORT = 1883

TOPIC_TEMPERATURE = "savonia/iot/temperature"
TOPIC_HUMIDITY = "savonia/iot/humidity"
TOPIC_LIGHT = "savonia/iot/light"

def main():
    mqtt_client = mqtt.Client()
    mqtt_client.connect(BROKER, BROKER_PORT, 60)
    print(f"Connected to MQTT broker: {BROKER}:{BROKER_PORT}")

    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((HOST, PORT))
    server.listen(1)
    print(f"Socket server listening on {HOST}:{PORT}")

    conn, addr = server.accept()
    print(f"Connected by sensor node: {addr}")

    try:
        while True:
            data = conn.recv(1024)
            if not data:
                break

            message = data.decode().strip()
            temperature, humidity, light = message.split(",")

            mqtt_client.publish(TOPIC_TEMPERATURE, temperature)
            mqtt_client.publish(TOPIC_HUMIDITY, humidity)
            mqtt_client.publish(TOPIC_LIGHT, light)

            print("Forwarded:", message)

    except KeyboardInterrupt:
        print("Edge device stopped.")

    finally:
        conn.close()
        server.close()
        mqtt_client.disconnect()

if __name__ == "__main__":
    main()