
# ⚡ 8-Bit Carry Look-Ahead Adder (CLA) Using Verilog HDL

<p align="center">
  <b>RTL Design | Digital Logic Design | Functional Verification</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Language-Verilog-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Design-8--Bit%20CLA-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Simulation-Synopsys%20VCS-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Debugging-Synopsys%20Verdi-purple?style=for-the-badge" />
</p>

## 📌 1. Project Overview

This project presents the RTL design and functional verification of an **8-bit Carry Look-Ahead Adder (CLA)** using Verilog Hardware Description Language (HDL).

A Carry Look-Ahead Adder is a high-speed digital adder that reduces carry propagation delay by calculating carry signals in advance using Generate and Propagate logic.

Unlike a conventional Ripple Carry Adder, the CLA calculates carry signals using parallel logic equations, improving addition speed.

The design accepts two 8-bit binary operands and one carry input (Cin), producing an 8-bit sum and a 1-bit carry output.

The design is simulated using Synopsys VCS, and waveform analysis is performed using Synopsys Verdi.

## 🎯 2. Design Specifications

| Parameter | Description |
|---|---|
| Design Name | 8-Bit Carry Look-Ahead Adder |
| Design Type | Combinational Logic |
| Architecture | Carry Look-Ahead Adder |
| Input Operand A | 8-bit |
| Input Operand B | 8-bit |
| Carry Input | 1-bit |
| Sum Output | 8-bit |
| Carry Output | 1-bit |
| Arithmetic Operation | Binary Addition |
| Logic Signals | Generate and Propagate |
| HDL | Verilog |
| Simulator | Synopsys VCS |
| Waveform Viewer | Synopsys Verdi |
| Waveform Format | VCD |

## ⚙️ 3. Design Methodology

The Carry Look-Ahead Adder uses Generate and Propagate signals to calculate carry outputs in parallel.

### 3.1 Generate Signal (G)

A carry is generated when both input bits are HIGH.

**Boolean Equation:**

```text
G(i) = A(i) AND B(i)
```

**Verilog Implementation:**

```verilog
assign g = a & b;
```

### 3.2 Propagate Signal (P)

A carry is propagated when the XOR of the two input bits is HIGH.

**Boolean Equation:**

```text
P(i) = A(i) XOR B(i)
```

**Verilog Implementation:**

```verilog
assign p = a ^ b;
```

### 3.3 Carry Generation Equations

The carry signals are calculated using look-ahead logic equations.

**Carry Equations:**

```text
C1 = G0 + P0.C0

C2 = G1 + P1.G0 + P1.P0.C0

C3 = G2 + P2.G1 + P2.P1.G0
     + P2.P1.P0.C0

C4 = G3 + P3.G2 + P3.P2.G1
     + P3.P2.P1.G0
     + P3.P2.P1.P0.C0
```

The same logic is extended up to C8 for the 8-bit adder.

### 3.4 Sum Generation

The sum is calculated using the Propagate signal and the corresponding carry input.

**Boolean Equation:**

```text
S(i) = P(i) XOR C(i)
```

**Verilog Implementation:**

```verilog
assign S = p ^ c[7:0];
assign Cout = c[8];
```

The final carry C8 is assigned to the carry output.

## 🔌 4. Module Interface

| Signal | Direction | Width | Description |
|---|---|---|---|
| `a` | Input | 8 bits | First operand |
| `b` | Input | 8 bits | Second operand |
| `c0` | Input | 1 bit | Carry input |
| `S` | Output | 8 bits | Sum output |
| `Cout` | Output | 1 bit | Final carry output |

## 📂 5. Repository Structure

```text
8-bit-Carry-Look-Ahead-Adder/
│
├── bit8_cla.v
│   └── CLA RTL design
│
├── bit8_cla_tb.v
│   └── Functional verification testbench
│
├── bit8_cla.vcd
│   └── Simulation waveform database
│
├── screenshots/
│   └── waveform.png
│
├── README.md
│
└── .gitignore
```

Generated simulation files such as compiled executables and intermediate simulation directories can be maintained locally rather than committed to GitHub.

## 🧪 6. Testbench and Functional Verification

A Verilog testbench is developed to verify the functionality of the 8-bit Carry Look-Ahead Adder.

The testbench applies seven different combinations of input operands and carry inputs to verify the sum and carry outputs.

### 6.1 Test Scenarios

| Test Case | A | B | Cin | Expected Sum | Cout |
|---|---:|---:|---:|---:|---:|
| TC1 | 8 | 4 | 0 | 12 | 0 |
| TC2 | 50 | 30 | 1 | 81 | 0 |
| TC3 | 30 | 50 | 0 | 80 | 0 |
| TC4 | 255 | 1 | 0 | 0 | 1 |
| TC5 | 255 | 255 | 1 | 255 | 1 |
| TC6 | 0 | 0 | 0 | 0 | 0 |
| TC7 | 90 | 70 | 1 | 161 | 0 |

### 6.2 Test Case Explanation

- **TC1 – Normal Addition:** Tests addition without an input carry.
- **TC2 – Carry Input:** Verifies addition with Cin = 1.
- **TC3 – Basic Addition:** Checks another normal addition.
- **TC4 – Overflow:** Checks carry generation when the result exceeds 8 bits.
- **TC5 – Maximum Addition:** Tests maximum input values with carry input.
- **TC6 – Zero Addition:** Verifies addition of two zero values.
- **TC7 – Carry Generation:** Checks addition with an input carry.

### 6.3 Testbench Features

- Initial blocks to apply input combinations.
- Time delays between test cases using `#10`.
- `$monitor` to display simulation results.
- `$dumpfile` to create a VCD file.
- `$dumpvars` to record waveform signals.
- `$finish` to terminate simulation.

## 💻 7. Simulation Environment

The design is simulated using Synopsys VCS and analyzed using Synopsys Verdi.

### 7.1 Simulation Workflow

```text
       Verilog RTL Design
               |
               v
        Verilog Testbench
               |
               v
         Synopsys VCS
               |
               v
         RTL Simulation
               |
               v
          VCD Database
               |
               v
        Synopsys Verdi
               |
               v
        Waveform Analysis
```

### 7.2 VCS Compilation

Compile the RTL source and testbench using:

```bash
vcs -full64 -kdb -debug_access+all \
bit8_cla.v bit8_cla_tb.v
```

### 7.3 Execute Simulation

```bash
./simv
```

The simulation executes the testbench and generates the VCD waveform when the dump commands are enabled.

### 7.4 VCD Waveform Generation

Add the following commands inside the testbench:

```verilog
initial
begin
    $dumpfile("bit8_cla.vcd");
    $dumpvars(0, bit8_cla_tb);
end
```

### 7.5 Open Waveform in Synopsys Verdi

```bash
verdi -ssf bit8_cla.vcd &
```

The generated waveform can be inspected using the Verdi waveform viewer.

## 📊 8. Waveform Analysis

The simulation waveform is analyzed using Synopsys Verdi.

The following signals are observed:

| Signal | Width | Description |
|---|---|---|
| `a[7:0]` | 8 bits | First input operand |
| `b[7:0]` | 8 bits | Second input operand |
| `c0` | 1 bit | Input carry |
| `S[7:0]` | 8 bits | Sum output |
| `Cout` | 1 bit | Final carry output |

**Waveform Observations:**

- Input operands change according to the testbench.
- Generate and Propagate signals determine carry generation.
- Carry signals are calculated using look-ahead logic.
- Sum outputs are generated for each input combination.
- Final carry output indicates overflow beyond 8 bits.
- Waveform analysis helps verify the functional behavior of the CLA.

### 🖼️ Simulation Waveform

![8-Bit CLA Simulation Waveform](screenshots/waveform.png)

## 🛠️ 9. Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| Verilog HDL | RTL design implementation |
| Synopsys VCS | RTL compilation and simulation |
| Synopsys Verdi | Waveform visualization and debugging |
| VCD | Simulation waveform database |
| Git | Version control |
| GitHub | Source code management and documentation |

## 🎓 10. Key Learning Outcomes

Through this project, the following concepts are explored:

- Combinational digital circuit design.
- 8-bit binary addition.
- Carry Look-Ahead Adder architecture.
- Generate and Propagate logic.
- Parallel carry generation.
- Carry propagation delay reduction.
- Verilog RTL modeling.
- Testbench development and functional verification.
- RTL simulation using Synopsys VCS.
- Waveform analysis using Synopsys Verdi.

## 🚀 11. Future Enhancements

Potential extensions to this project include:

- Extending the CLA architecture to 16-bit and 32-bit adders.
- Comparing CLA and Ripple Carry Adder architectures.
- Implementing hierarchical Carry Look-Ahead logic.
- Performing RTL synthesis and area analysis.
- Evaluating propagation delay and critical paths.
- Implementing parameterized adder architectures.
- Performing gate-level simulation and timing verification.

## 👨‍💻 12. Author

**SANTHOSH KUMAR N A**

RTL Design | Digital Design | VLSI Engineering

- GitHub: [Your GitHub Profile](https://github.com/your-username)
- LinkedIn: [Your LinkedIn Profile](https://linkedin.com/in/your-profile)

## 📜 13. License

This project is intended for educational and learning purposes.

You are welcome to explore, modify, and extend the implementation with appropriate attribution.

---

<p align="center">
  <b>Designed with Verilog HDL | Simulated with Synopsys VCS | Debugged with Synopsys Verdi</b>
</p>

<p align="center">
  ⭐ If you find this project useful, consider starring the repository!
</p>

---

## 🏷️ GitHub Topics

verilog · verilog-hdl · carry-look-ahead-adder · 8-bit-cla · digital-design · arithmetic-circuits · rtl-design · vlsi · combinational-logic · synopsys-vcs · synopsys-verdi · waveform-analysis
