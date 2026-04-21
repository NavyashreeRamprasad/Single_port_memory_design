# Single_port_memory_design

## 📌 Memory Module in Verilog (CPU-Memory Interface)

This project implements a parameterized **memory module in Verilog**, designed to simulate a simple CPU-to-memory interface using a **valid-ready handshake protocol**.

### 🚀 Features

* Configurable **data width (16-bit)** and **memory depth (24 locations)**
* Automatic **address width calculation** using `$clog2`
* Supports both **read and write operations**
* Implements **valid-ready handshake** for synchronization
* Includes **reset logic** to initialize memory and outputs

### 🧠 Design Overview

The module acts as a memory block (DUT), interacting with a CPU (testbench) through control signals:

* `valid`: Indicates a request from the CPU
* `ready`: Signals memory is ready to process the request
* `wr_rd`: Selects operation

  * `1` → Write
  * `0` → Read

### 🔄 Operation

* **Write Operation**: Stores `wdata` at the given `addr`
* **Read Operation**: Outputs data from `addr` to `rdata`
* **Reset**: Clears memory contents and outputs

### 🛠️ Technologies Used

* Verilog HDL
* Digital Design Concepts

### 📂 Use Cases

* Learning basic memory design
* Practicing CPU-memory interfacing
* Verification and simulation exercises


