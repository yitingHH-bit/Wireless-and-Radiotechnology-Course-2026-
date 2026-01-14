# Local Wi-Fi Network Analysis  
**Wireless and Radiotechnology Course 2026**

## Objective
The objective of this assignment is to understand and analyze a local Wi-Fi network
using a mobile network analysis tool. The experiment focuses on evaluating network
performance, configuration, signal quality, interference, and reliability, as well as
identifying potential issues and proposing practical improvements.

---

## Tools and Measurement Setup

- **Application:** NET Analyzer (Android)
- **Device:** Smartphone
- **Location:** Savonia University of Applied Sciences (campus environment)
- **Network under test:** Savonia-guest
- **Measurement type:** Passive Wi-Fi analysis, latency measurements, signal scan

Measurements were taken while connected to the Wi-Fi network. Additional information
about nearby Wi-Fi networks was collected to evaluate interference and channel usage.

---

## Active Wi-Fi Network Information

### Network Identification
- **SSID:** Savonia-guest  
- **BSSID:** f8:6b:d9:95:d6:cc  
- **Vendor:** Cisco Systems, Inc.  
- **Wi-Fi standard:** IEEE 802.11ac (Wi-Fi 5)  
- **Frequency band:** 5 GHz  
- **Channel:** 36  
- **Center frequency:** 5180 MHz  
- **Security:** Open guest network  

---

### IP and Gateway Information
- **Client IP address:** 10.214.8.218  
- **Subnet mask:** 255.255.240.0  
- **Default gateway:** 10.214.15.254  
- **DNS servers:**  
  - 193.167.78.100  
  - 193.167.78.90  
- **IPv6 address:** fe80::9cf6:86ff:fecf:4bd2  
- **DHCP lease time:** 2 days  

This configuration indicates a centrally managed enterprise Wi-Fi network using
private IP addressing.

---

## Signal Strength and Performance

### Signal Strength
- **Wi-Fi signal level:** −68 dBm (5 GHz)

Signal strength interpretation:
- −30 to −50 dBm → excellent  
- −50 to −70 dBm → good  
- −70 to −80 dBm → fair  

A signal level of −68 dBm represents **good coverage** suitable for stable and
high-speed Wi-Fi connectivity.

---

### Latency Measurements
Measured round-trip times:
- **Gateway:** 16 ms  
- **google.com:** 39 ms  
- **facebook.com:** 20 ms  
- **x.com:** 21 ms  

These values indicate a stable local network and normal internet routing latency,
with no signs of excessive delay or congestion.

---

### Throughput Information
- **Reported link speed (Down / Up):** 162 / 360 Mbps  
- **Observed passive throughput:** Low at the moment of measurement (idle traffic)

The high link speed reflects the use of the 5 GHz band and the 802.11ac standard.
Low passive throughput simply indicates that no large data transfers were occurring
during the measurement.

---

## Nearby Wi-Fi Networks and Interference Analysis

A scan of nearby **2.4 GHz** Wi-Fi networks revealed the following:

| SSID           | Channel | Signal Strength |
|----------------|---------|-----------------|
| Savonia        | 1       | −49 dBm |
| eduroam        | 1       | −49 dBm |
| Savonia-AMK    | 1       | −50 dBm |
| iPhone         | 6       | −52 dBm |
| Savonia-IoT    | 11      | −61 dBm |
| eduroam        | 11      | −62 dBm |

All detected networks use **20 MHz** channels.

### Interference Observations
- Channels **1, 6, and 11** are heavily occupied
- Multiple strong signals overlap on the same channels
- This indicates **significant congestion in the 2.4 GHz band**

The active network (Savonia-guest) operates on **5 GHz**, which significantly reduces
interference and improves performance.

---

## Analysis

### Impact of Signal Strength on Performance
Good signal strength (−68 dBm) enables:
- High data rates
- Low latency
- Stable connectivity

As signal strength decreases, modulation efficiency and throughput would degrade,
especially on higher frequency bands such as 5 GHz.

---

### Network Stability and Reliability
- Low gateway latency confirms a stable local network
- Consistent latency to external servers indicates reliable internet connectivity
- Enterprise-grade Cisco infrastructure supports stable roaming and load balancing

---

### Channel Usage and Congestion
- Severe congestion observed in the 2.4 GHz spectrum
- Channel overlap can lead to increased retransmissions and reduced throughput
- Use of the 5 GHz band effectively avoids these issues

---

### Router / Access Point Placement
- Strong and uniform signals suggest good access point density
- Likely ceiling-mounted and centrally managed access points
- Suitable placement minimizes dead zones and signal fluctuations

---

## Identified Issues
- High congestion in the 2.4 GHz band
- Guest network operates without encryption
- 5 GHz performance may degrade faster with distance and obstacles

---

## Recommendations

1. Prefer **5 GHz** (or **6 GHz / Wi-Fi 6E**, if available) for performance-critical devices  
2. Reserve **2.4 GHz** for legacy or IoT devices only  
3. Enable **WPA3 security** on guest networks if supported  
4. Use automatic channel selection to adapt to congestion  
5. Maintain central and elevated access point placement  

---

## Conclusion
This experiment demonstrated how Wi-Fi performance is strongly influenced by signal
strength, frequency band selection, channel congestion, and network configuration.
The Savonia-guest network achieves good performance by operating in the 5 GHz band,
which avoids the heavily congested 2.4 GHz spectrum. Proper access point placement
and modern Wi-Fi standards result in stable latency, high throughput, and reliable
connectivity.

---

## Repository Contents


