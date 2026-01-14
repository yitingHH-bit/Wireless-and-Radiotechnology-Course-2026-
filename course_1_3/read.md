# Bluetooth Low Energy (BLE) Device Analysis  
**Wireless and Radiotechnology Course 2026**

---

## Objective
The objective of this experiment is to investigate and analyze nearby Bluetooth Low
Energy (BLE) devices using a mobile BLE scanning application. The goal is to understand
the characteristics of detected BLE devices, the relationship between RSSI and
estimated distance, and the influence of environment and device type on BLE signal
behavior. Additionally, security and privacy aspects of BLE usage are discussed.

---

## Tools and Measurement Setup

- **Application:** BLE Scanner (Android)
- **Device:** Smartphone with BLE support
- **Scan type:** Passive BLE scanning and selective device connection
- **Measurement location:** Home environment (indoor residential setting)
- **Date:** 2026-01-14

The BLE scanner application was used to detect nearby BLE devices and record their
signal strength (RSSI), approximate distance, device identifiers, and GATT services
where available.

---

## Scanning Environment Description

### Home Environment (Indoor)
- Enclosed residential space
- Presence of walls, furniture, and electronic devices
- Typical consumer devices such as smartphones, wearable devices, and IoT equipment
- Potential interference from Wi-Fi (2.4 GHz) and other BLE devices

---

## Data Collection

The following parameters were recorded for detected BLE devices:
- Device name (if available)
- RSSI (Received Signal Strength Indicator)
- MAC address or device identifier
- Estimated distance (as calculated by the scanner)
- Connectivity status (connectable / non-connectable)

Screenshots from the BLE Scanner app are included in the `screenshots/` directory as
measurement evidence.

---

## BLE Scan Results (Home Environment)

| Device Name | MAC Address | RSSI (dBm) | Estimated Distance (m) | Connectable | Notes |
|------------|------------|-----------|------------------------|-------------|-------|
| N/A | 44:52:22:11:58:1E | -44 | 0.18 | Yes | Very strong signal, very close device |
| N/A | 15:E8:4F:A4:84:92 | -65 | 2.00 | No | Moderate signal strength |
| N/A | 29:E3:2C:B1:A7:04 | -81 | 12.59 | No | Weak signal, far away |
| N/A | D2:C0:22:21:DE:91 | -85 | 19.95 | No | Very weak signal |
| N/A | 69:38:4D:F3:DD:7B | -73 | 5.01 | Yes | Medium distance |
| N/A | (various) | -73 | ~5–6 | No | Intermittent visibility |

---

## GATT Services Observed

For one connectable device, the following GATT services were discovered:

- **Generic Access (0x1800)**
- **Generic Attribute (0x1801)**
- Multiple **Custom Services**, including:
  - 5B833E05-6BC7-4802-8E9A-723CECA4BD8F
  - 5B833E06-6BC7-4802-8E9A-723CECA4BD8F
  - 0000FE2C-0000-1000-8000-00805F9B34FB
  - 00004D45-0000-1000-8000-00805F9B34FB

The presence of multiple custom services suggests the device is likely a consumer
product such as a wearable, smart accessory, or proprietary IoT device.

---

## Analysis

### Relationship Between RSSI and Estimated Distance
- Strong RSSI values (e.g. **-44 dBm**) correspond to very short distances (< 0.5 m)
- Medium RSSI values (-65 to -73 dBm) indicate devices a few meters away
- Weak RSSI values (-80 dBm and below) indicate distant devices or signal obstruction

The estimated distance is only approximate and is affected by environmental factors.

---

### Device Density and Types
- Several BLE devices were detected in a home environment
- Most devices do not broadcast identifiable names
- Likely device types include:
  - Smartphones
  - Wearables (e.g. smartwatches, earbuds)
  - IoT or smart home devices

---

### Patterns and Observed Anomalies
- RSSI fluctuates even when the device position is unchanged
- Some devices advertise frequently, others intermittently
- Many devices are **non-connectable**, indicating beacon-only behavior

These effects are influenced by:
- Transmission power settings
- Advertising interval differences
- Body absorption and wall attenuation
- Interference from Wi-Fi and other BLE devices

---

## Environmental Effects
- Indoor walls and furniture reduce signal strength
- Human presence affects signal stability
- Short-range devices produce very strong RSSI values
- BLE performance is sensitive to antenna orientation and obstacles

---

## Security and Privacy Considerations

### Common BLE Usage
- Wearable devices (fitness trackers, smartwatches)
- Smartphones broadcasting BLE advertisements
- Smart home and IoT devices
- Proximity beacons

---

### Security and Privacy Risks
- **Device tracking:** Persistent identifiers may allow passive tracking
- **Identifier exposure:** MAC addresses or service UUIDs can leak information
- **Passive scanning risk:** BLE advertisements can be captured without user consent

Modern BLE standards attempt to mitigate these risks using:
- MAC address randomization
- Rotating identifiers
- Limited advertising data payloads

---

## Conclusion
This experiment demonstrated that Bluetooth Low Energy devices are widely present even
in a typical home environment. RSSI values show a clear relationship with estimated
distance, although environmental factors introduce variability. BLE is well suited for
low-power communication but raises important security and privacy considerations due to
its broadcast-based nature.

---

## Repository Structure


