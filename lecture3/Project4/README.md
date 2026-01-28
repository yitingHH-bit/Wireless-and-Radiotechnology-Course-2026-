## Wireless Products and Manufacturers
name:jiancai Hou 
Student ID:s2314604
 
---

## Selected Device
**Nordic Semiconductor nRF52840 (BLE SoC)**

## Official Datasheet
https://www.nordicsemi.com/Products/nRF52840

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
