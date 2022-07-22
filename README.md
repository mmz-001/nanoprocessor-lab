# Nanoprocessor

A nanoprocessor capable of executing a set of simple instructions.

## TODO

- [x] Display output in 7-segment display
- [ ] 8-bit registers
- [ ] Add 32 registers to Program ROM
- [ ] Add additional flags
  - [ ] Zero Flag (Zero)
  - [ ] Overflow Flag (Overflow)
  - [ ] Interrupt flag (Interrupt)
  - [ ] Negative flag (Negative)
- [ ] Add additional instructions (16 16-bit instructions) and modify existing instructions (Check instruction set below for additional details).
  - [ ] MOVI
  - [ ] ADD
  - [ ] NEG
  - [ ] JZ
  - [ ] MOV
  - [ ] MUL
  - [ ] DIV
  - [ ] MOD
  - [ ] IN
  - [ ] CMP
  - [ ] HALT
  - [ ] JO
  - [ ] JS
  - [ ] JINT
  - [ ] INC
  - [ ] DEC
- [ ] Create a compiler for the new instructions.
- [ ] Display output in 7-segment display in decimal (Use a separate component for conversion).
- [ ] Create a non-trivial program to illustrate the additional features (e.g, a calculator for with ADD, SUB, MUL, and DIV operations that can take input from the BASYS3 board).

## Instruction set

<!-- Disable word wrap to display table correctly-->

| Instruction | Description                                                                                                                                             | Machine Code (16-bit)                   | Flags Set                 |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | ------------------------- |
| `MOVI R d`  | Move immediate value d to register `R`                                                                                                                  | `0 0 1 0 R[0..2] 0 d[0..7]`             | -                         |
| `ADD RA RB` | Add values in registers `RA` and `RB` and store the result in `RA`                                                                                      | `0 0 0 0 RA[0..2] RB[0..2] 0 0 0 0 0 0` | Zero, Oveflow, Negative   |
| `NEG R`     | Two’s complement of register `R`                                                                                                                        | `0 0 0 1 R[0..2] 0 0 0 0 0 0 0 0 0`     | Zero, Negative            |
| `JZR R d`   | Jump to address `d` if value in register R is 0                                                                                                         | `0 0 1 1 R[0..2] 0 0 0 0 d[0..4]`       | -                         |
| `MOV RA RB` | Move value in register `RB` to `RA`                                                                                                                     | `0 1 0 0 RA[0..2] RB[0..2] 0 0 0 0 0 0` | -                         |
| `MUL RA RB` | Multiply value in `RA` with value in `RB` and store the result in `RA`                                                                                  | `0 1 0 1 RA[0..2] RB[0..2] 0 0 0 0 0 0` | Zero, Overflow, Negative  |
| `DIV RA RB` | Divide value in `RA` by value in `RB` and store the result in `RA`. If value in `RB` is zero set `Interrupt` flag                                       | `0 1 1 0 RA[0..2] RB[0..2] 0 0 0 0 0 0` | Zero, Negative, Interrupt |
| `MOD RA RB` | Calculate mod of value in `RA` with value in `RB` and store the result in `RA`. If value in `RB` is zero set `Interrupt` flag                           | `0 1 1 1 RA[0..2] RB[0..2] 0 0 0 0 0 0` | Zero, Negative, Interrupt |
| `IN R P`    | Take input from port `P` and store the result in register `R`. Port 0 is maps to Switches and port 1 maps to push buttons.                              | `1 0 0 0 R[0..2] 0 0 0 0 0 0 P[0..2]`   | -                         |
| `CMP RA RB` | Compare value in `RA` with value in `RB` and if the values are equal set `Zero` flag, if RA is less than RB set `Negative` flag, otherwise set no flags | `1 0 0 1 RA[0..2] RB[0..2] 0 0 0 0 0 0` | Zero, Negative            |
| `HALT`      | Halt execution.                                                                                                                                         | `1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0`       | -                         |
| `JO d`      | Jump to address `d` if `Overflow` flag is set                                                                                                           | `1 0 1 1 0 0 0 0 0 0 0 d[0..4]`         | -                         |
| `JS d`      | Jump to address `d` if `Negative` flag is set                                                                                                           | `1 1 0 0 0 0 0 0 0 0 0 d[0..4]`         | -                         |
| `JINT d`    | Jump to address `d` if `Interrupt` flag is set                                                                                                          | `1 1 0 1 0 0 0 0 0 0 0 d[0..4]`         | -                         |
| `INC R`     | Increment value in register `R`                                                                                                                         | `1 1 1 0 R[0..2] 0 0 0 0 0 0 0 0 0`     | Zero, Negative, Overflow  |
| `DEC R`     | Decrement value in register `R`                                                                                                                         | `1 1 1 1 R[0..2] 0 0 0 0 0 0 0 0 0`     | Zero, Negative, Overflow  |
