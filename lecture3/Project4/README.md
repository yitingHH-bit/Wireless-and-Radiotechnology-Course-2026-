## Wireless Products and Manufacturers
name:jiancai Hou 
Student ID:s2314604
 
---

## Selected Device
**Nordic Semiconductor nRF52840 (BLE SoC)**

## Official Datasheet
https://www.nordicsemi.com/Products/nRF52840
<img width="1717" height="935" alt="image" src="https://github.com/user-attachments/assets/d603dfe4-091f-4e3c-a171-0135add358ef" />

---

## Device Overview
The nRF52840 is a Bluetooth Low Energy (BLE) System-on-Chip integrating a 2.4 GHz RF transceiver with a powerful ARM Cortex-M4F microcontroller. It is widely used in IoT, wearable, and wireless sensor applications.

---

## RF System Blocks Explanation

### 1. Information Source / MCU
The ARM Cortex-M4F MCU runs the application firmware and protocol stack. It generates digital data that will be transmitted over the RF link and processes received data from the RF subsystem.

### 2. Modulation / Demodulation
This block converts digital data into a modulated RF signal for transmission and demodulates received RF signals back into digital form. The nRF52840 supports GFSK modulation for Bluetooth Low Energy.

### 3. RF Transceiver (Tx/Rx)
The RF transceiver handles both transmission and reception at 2.4 GHz. It performs frequency synthesis, upconversion for transmission, and downconversion for reception.

### 4. Power Amplifier (PA)
The PA amplifies the RF signal before it is sent to the antenna. This increases the transmission range while maintaining controlled output power to meet regulatory limits.

### 5. Low Noise Amplifier (LNA)
The LNA amplifies very weak incoming RF signals from the antenna with minimal added noise. This improves receiver sensitivity and communication reliability.

### 6. RF Filtering / Matching Network
This block ensures impedance matching between the RF transceiver and the antenna. It also suppresses unwanted harmonics and out-of-band noise.

### 7. Antenna Interface
The antenna interface connects the RF front-end to an external or PCB antenna. It radiates transmitted signals and captures incoming wireless signals.

### 8. Power Supply for RF Section
A dedicated regulated power supply provides stable voltage to RF blocks. This ensures low noise operation and stable RF performance.

---

## RF Block Diagram
See the file below:

`nRF52840_RF_Block_Diagram.png`


Selected Device

Device Name: ESP32 (2.4 GHz Wi-Fi + Bluetooth Low Energy SoC)
Manufacturer: Espressif Systems

Datasheet Link:
https://www.espressif.com/sites/default/files/documentation/esp32_datasheet_en.pdf

Objective

The objective of this task is to understand the internal RF system structure of a real wireless communication device.
By identifying and explaining the main RF blocks of the ESP32, this task develops system-level RF thinking, which is an essential skill for IoT, embedded, and wireless engineers.

RF System Block Diagram

See the file below:

ESP32_RF_Block_Diagram.png

RF Block Explanations
1. Information Source / MCU

The ESP32 uses a dual-core Tensilica Xtensa MCU to process application logic and communication protocols.
Digital baseband data for Wi-Fi or BLE is generated here before being sent to the RF transceiver.

2. Modulation / Demodulation

This block converts digital baseband data into modulated RF signals and vice versa.
For transmission, data is modulated (e.g., GFSK for BLE, OFDM for Wi-Fi), and for reception, incoming RF signals are demodulated back into digital data.

3. RF Transceiver (Tx / Rx)

The RF transceiver handles frequency conversion between baseband and the 2.4 GHz RF band.
It switches between transmit and receive modes and manages upconversion and downconversion of signals.

4. Power Amplifier (PA)

The power amplifier boosts the RF signal power during transmission.
This ensures the signal has sufficient strength to reach other wireless devices within the required range.

5. Low Noise Amplifier (LNA)

The LNA amplifies weak received RF signals while adding minimal noise.
This improves receiver sensitivity and helps maintain reliable communication.

6. RF Filtering / Matching Network

This block filters unwanted frequencies and matches the impedance between the RF transceiver and the antenna.
Proper filtering and matching improve signal quality and maximize power transfer.

7. Antenna Interface

The antenna interface connects the RF front end to an external or PCB antenna.
It radiates transmitted RF energy and captures incoming wireless signals.

8. Power Supply for RF Section

A dedicated power supply provides stable voltage to RF blocks such as the PA, LNA, and transceiver.
Good power regulation is critical to minimize noise and ensure RF performance stability.

Conclusion

The ESP32 integrates MCU, baseband processing, RF transceiver, and RF front-end components into a single SoC.
This high level of integration makes it well suited for IoT and wireless applications while clearly demonstrating essential RF system blocks.
