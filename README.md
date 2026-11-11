
# 🚀 8-Bit Carry Look-Ahead Adder (CLA) Using Verilog HDL

## 📌 Project Overview

This project implements an **8-bit Carry Look-Ahead Adder (CLA)** using Verilog HDL.

A Carry Look-Ahead Adder is a high-speed digital adder that reduces carry propagation delay by calculating carry signals in advance using Generate and Propagate logic.

Unlike a Ripple Carry Adder, the CLA calculates carry signals using parallel logic equations, improving addition speed.

## ✨ Features

- ⚡ 8-bit Carry Look-Ahead Adder
- 💻 Designed using Verilog HDL
- 🔄 Uses Generate (G) and Propagate (P) signals
- 🚀 Parallel carry generation
- ➕ Supports carry input (Cin)
- 📤 Produces 8-bit Sum and 1-bit Carry-out
- 🧪 Includes a Verilog testbench
- 📊 Generates VCD waveform for simulation analysis

## 🛠️ Tools Used

- Verilog HDL
- Synopsys VCS / ModelSim / QuestaSim
- Synopsys Verdi
- VCD Waveform Viewer

## 📂 Project Structure

```text
8-bit-Carry-Look-Ahead-Adder/
|
|-- bit8_cla.v          # CLA Design
|-- bit8_cla_tb.v       # Testbench
|-- bit8_cla.vcd        # Waveform File
|-- screenshot.png      # Simulation Screenshot
|-- README.md           # Project Documentation
```

## ⚙️ Working Principle

The Carry Look-Ahead Adder uses two important signals.

### 1️⃣ Generate Signal (G)

A carry is generated when both input bits are HIGH.

```verilog
assign g = a & b;
```

Equation:

G(i) = A(i) AND B(i)

### 2️⃣ Propagate Signal (P)

A carry is propagated when the XOR of the two input bits is HIGH.

```verilog
assign p = a ^ b;
```

Equation:

P(i) = A(i) XOR B(i)

### 3️⃣ Carry Generation

The carry signals are calculated using look-ahead equations.

C1 = G0 + P0C0

C2 = G1 + P1G0 + P1P0C0

C3 = G2 + P2G1 + P2P1G0 + P2P1P0C0

The same logic is extended up to C8.

### 4️⃣ Sum Generation

The sum is calculated using:

S(i) = P(i) XOR C(i)

Verilog implementation:

```verilog
assign S = p ^ c[7:0];
assign Cout = c[8];
```

## 🔌 Module Interface

| Signal | Direction | Width | Description |
|--------|-----------|-------|-------------|
| a | Input | 8-bit | First operand |
| b | Input | 8-bit | Second operand |
| c0 | Input | 1-bit | Carry input |
| S | Output | 8-bit | Sum output |
| Cout | Output | 1-bit | Carry output |

## 🧪 Testbench and Verification

The testbench verifies the functionality of the CLA using different input combinations.

### 📋 Test Cases

| Test Case | A | B | Cin | Expected Sum | Cout |
|-----------|---|---|-----|--------------|------|
| 1 | 8 | 4 | 0 | 12 | 0 |
| 2 | 50 | 30 | 1 | 81 | 0 |
| 3 | 30 | 50 | 0 | 80 | 0 |
| 4 | 255 | 1 | 0 | 0 | 1 |
| 5 | 255 | 255 | 1 | 255 | 1 |
| 6 | 0 | 0 | 0 | 0 | 0 |
| 7 | 90 | 70 | 1 | 161 | 0 |

### 🔍 Testbench Features

- Initial blocks to apply input combinations.
- Time delays between test cases using #10.
- $monitor to display simulation results.
- $dumpfile to create a VCD file.
- $dumpvars to record waveform signals.
- $finish to terminate simulation.

## ▶️ Simulation Steps

### Step 1: Compile the Verilog Files

Using Synopsys VCS Verdi:

```bash
vcs -full64 -kdb -debug_access+all 8bitcla.v 8bitcla_tb.v
verdi -dbdir simv.daidir &
```

### Step 2: Run Simulation

```bash
./simv
```

### Step 3: View Waveform

```bash
bit8_cla.vcd
```

The waveform can also be viewed using Synopsys Verdi.

## 📊 Simulation Waveform

The waveform shows the changes in input operands (a and b), carry input (c0), sum (S), and carry output (Cout).

Add your simulation screenshot below:

![8-bit CLA Simulation](screenshot.png)

## 💡 Applications

- ⚡ High-speed arithmetic circuits
- 🧮 Arithmetic Logic Units (ALUs)
- 💻 Microprocessors
- 📡 Digital Signal Processing
- 🏗️ Computer Architecture
- 🔬 VLSI Design

## 🎯 Conclusion

The 8-bit Carry Look-Ahead Adder was successfully designed and simulated using Verilog HDL.

The design uses Generate and Propagate signals to calculate carry bits in parallel, reducing carry propagation delay compared to a conventional Ripple Carry Adder.

The testbench verifies the functionality of the design using multiple input combinations, including carry generation and overflow conditions.

## 👨‍💻 Author

SANTHOSH KUMAR N A

## 📖 Project Details

- 📌 Project Name: 8-Bit Carry Look-Ahead Adder
- 💻 Language: Verilog HDL
- 🔧 Domain: Digital Electronics / VLSI Design
- 📊 Simulation: Synopsys Verdi
- ⭐ Project Type: Digital Design
