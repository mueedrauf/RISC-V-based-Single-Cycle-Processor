<div align="center">

# 🚀 RISC-V Single-Cycle Processor

**A minimalist, fully-verified RISC-V processor built from scratch in SystemVerilog**

![SystemVerilog](https://img.shields.io/badge/SystemVerilog-HDL-blueviolet?style=for-the-badge&logo=v&logoColor=white)
![RISC-V](https://img.shields.io/badge/RISC--V-ISA-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Verified-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-Academic-orange?style=for-the-badge)

*GIK Institute of Engineering Sciences and Technology — Computer System Architecture (CSA)*
*by **Mueed Rauf***

</div>

---

## 📖 Overview

This project implements a **single-cycle RISC-V processor** in SystemVerilog, designed for clarity, correctness, and educational value. Every instruction — from fetch to write-back — completes in a **single clock cycle**, making the datapath easy to trace, verify, and understand.

The processor supports a focused subset of the RISC-V ISA:

| Type | Instructions | Description |
|------|-------------|-------------|
| **R-type** | `add`, `sub`, `and`, `or`, `slt` | Register-to-register ALU ops |
| **I-type** | `lw`, `addi` | Load word & immediate arithmetic |
| **S-type** | `sw` | Store word to memory |
| **B-type** | `beq` | Conditional branch |
| **J-type** | `jal` | Jump and link |

---

## 🗂️ Repository Structure

```
RISC-V-based-Single-Cycle-Processor/
│
├── 📁 sources_1/new/          # All SystemVerilog source modules
│   ├── Processor.sv           # ⭐ Top-level processor (integrates all modules)
│   ├── Control_Unit.sv        # Generates all datapath control signals
│   ├── ALU.sv                 # Arithmetic & Logic Unit
│   ├── ALU_decoder.sv         # Maps funct bits → ALU control code
│   ├── Decoder.sv             # Instruction field splitter
│   ├── inst_Mem.sv            # Instruction memory
│   ├── Data_Mem.sv            # Data memory (load/store)
│   ├── Reg_file.sv            # 32-register file
│   ├── sign_extender.sv       # Immediate sign extension
│   ├── Program_Counter.sv     # PC register with reset
│   ├── adder.sv               # PC+4 / branch target adder
│   ├── mux2_1.sv              # 2-to-1 multiplexer
│   └── mux4_1.sv              # 4-to-1 multiplexer
│
├── 📁 sim_1/                  # Testbench simulations for every module
│   ├── tb_processor.sv
│   ├── tb_ALU.sv
│   ├── tb_ALU_decoder.sv
│   ├── tb_Control_Unit.sv
│   ├── tb_Data_Memory.sv
│   ├── tb_Decoder.sv
│   ├── tb_inst_Mem.sv
│   ├── tb_program_Counter.sv
│   ├── tb_Reg_file.sv
│   └── tb_Sign_Extender.sv
│
├── 📄 Single_cycle@mueed.pdf  # Full project report (PDF)
├── 📦 SSReport.zip            # LaTeX source → open & edit on Overleaf!
└── 📄 README.md
```

---

## 🏗️ Module Hierarchy

```
Processor.sv  ← TOP MODULE
│
├── Program_Counter.sv      (stores current PC, resets to 0x00)
├── adder.sv  ×2            (PC+4 and PC+ImmExt for branch/jump)
├── inst_Mem.sv             (instruction memory — fetches 32-bit words)
├── Decoder.sv              (splits instr into op, rs1, rs2, rd, funct, imm)
│
├── Control_Unit.sv         (opcode → control signals)
│   └── ALU_decoder.sv      (ALUOp + funct → ALUControl[2:0])
│
├── sign_extender.sv        (imm[11:0/11:5/12:1/20:1] → 32-bit ImmExt)
├── Reg_file.sv             (32 × 32-bit registers, sync write / async read)
├── ALU.sv                  (add, sub, and, or, slt + zero flag)
├── Data_Mem.sv             (byte-addressed RAM, sync write / async read)
│
├── mux2_1.sv               (SrcB select: register vs. immediate)
└── mux4_1.sv               (Result select: ALU / memory / PC+4)
```

---

## ⚡ Datapath at a Glance

```
         ┌─────────────┐
  CLK ──►│     PC      │──► Inst Memory ──► Decoder
         └─────────────┘                       │
               │ PC+4                          ▼
               ▼                        Control Unit
         Branch/Jump Adder                     │
               │                         ALU Decoder
               ▼                               │
         MUX (PCSrc) ◄──────────────── ALU ◄──┤
                                         │     │
                                    Zero Flag  Sign Extender
                                         │
                                    Data Memory
                                         │
                                    MUX (ResultSrc)
                                         │
                                    Register File ◄─── Write-back
```

---

## 🔬 Verification

Every module has its own dedicated testbench in `sim_1/`. Simulations were run in **Vivado** with waveform inspection at each stage.

| Module | Testbench | What's verified |
|--------|-----------|----------------|
| Program Counter | `tb_program_Counter.sv` | Reset to 0, increments on clock edge |
| Instruction Memory | `tb_inst_Mem.sv` | Correct fetch per PC value |
| Decoder | `tb_Decoder.sv` | Correct field extraction for all formats |
| Control Unit | `tb_Control_Unit.sv` | Correct signals per opcode |
| ALU Decoder | `tb_ALU_decoder.sv` | funct3/7 → ALUControl mapping |
| ALU | `tb_ALU.sv` | add, sub, or, slt + zero flag |
| Register File | `tb_Reg_file.sv` | Read, write-back on clock edge |
| Sign Extender | `tb_Sign_Extender.sv` | I/S/B/J immediate formation |
| Data Memory | `tb_Data_Memory.sv` | Load & store paths |
| **Top-Level Processor** | **`tb_processor.sv`** | **Full instruction sequence** |

---

## 📄 Report & LaTeX Source

- 📕 **`Single_cycle@mueed.pdf`** — Full project report with architecture diagrams, control tables, simulation screenshots, and discussion.
- 📦 **`SSReport.zip`** — Complete LaTeX source for the report.
  > 💡 **Want to modify or reuse the report?** Upload `SSReport.zip` directly to [Overleaf](https://www.overleaf.com) — it's ready to compile!

---

## 🛠️ How to Run

1. **Clone the repo**
   ```bash
   git clone https://github.com/mueedrauf/RISC-V-based-Single-Cycle-Processor.git
   ```

2. **Open in Vivado**
   - Add all files from `sources_1/new/` as design sources
   - Add all files from `sim_1/` as simulation sources
   - Set `Processor.sv` as the top module

3. **Run simulation**
   - Select any testbench (e.g. `tb_processor`) and run behavioral simulation
   - Inspect waveforms for each signal

---

## 📚 Reference

> Harris, S. L. & Harris, D. M. (2021). *Digital Design and Computer Architecture: RISC-V Edition*. Morgan Kaufmann.

---

## 🙏 Acknowledgements

Special thanks to **Prof. Fahad** and **Sir Abbas** for their guidance throughout this project, and to the CSA course for providing the foundation to build something this fun from scratch.

---

<div align="center">

Made with ❤️ at **GIKI** | Department of Computer Engineering

⭐ *Star this repo if you found it useful for learning processor design!*

</div>
