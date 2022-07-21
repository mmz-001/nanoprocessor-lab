# Style Guide

> "It is important to use a consistent, universal style for such things as entity declarations, component declarations, port mappings, functions, and procedures." - Xilinx

## Comments

- Commenting statements is important so that the reader will understand the reasoning behind it and its relationship with respect to the entire code block. You need not comment every statement, but those that are key to the behavior of the component should generally be commented.
- Remove auto-generated comments by Xilinx Vivado.

## Indentation

- Any section of code that is marked by an end (and, optionally, a begin) keyword should have its body indented.

## Naming Conventions

- Use descriptive names for signals or components unless specified otherwise.
  - Descriptive: Clk and Res. Specification: I, M, R. Can use D, A (including A0, A1,...), B for inputs and Q for outputs.
- Entity, component, and signal names should be in Pascal_Snake_Case. Abbreviations and acronyms should be in UPPERCASE.
  - Reg_4, Add_Sub_4, D_FF_4, PC_3, MUX_8_To_1.
- Component names should include the number of bits and/or number of sub-components and/or in/out wires used. The number of bits should be the last suffix
  - PC_3 (3-bit), LUT_12_8 (12 8-bit LUTs), Reg_8_4 (8 4-bit register bank).
- Use CONSTANT_CASE for types and operators.
  - STD_LOGIC_VECTOR, IEEE.STD_LOGIC_1164.ALL, AND, OR, XOR.
- Use '\_Addr' suffix for addresses
  - Jump_Addr.
- Do **not** use '\_In' and '\_Out' suffixes for port signal names. When these are connected to other signals with similar suffixes, your code can become very confusing.
- Use '\_TB' suffix for test bench source files
  - Reg_4_TB

## Folder structure

- All VHDL design source files are placed in the `src` folder.
- The `src` folder contains three sub-folders organized according to 'levels' (defined below) to easily find components.

  - `level_1`: Contains components without any dependent components (i.e., no component declarations).
    - `HA.vhd`, `Ins_Decoder.vhd`, and `DFF_4.vhd` uses only basic logic gates and/or behavioral model, no external components used.
  - `level_2`: Contains level_1 components as dependencies.
    - `FA.vhd` uses HA as a sub-component. `PC_3.vhd` Uses DFF_4 as a sub-component.
  - `level_3`: Contains level_2 components as dependencies.
    - `Nanoprocessor.vhd`, `MUX_8_To_1`.

- Test bench source files are placed in the `sim` folder with the same organizational hierarchy as the `src` folder.
- BASYS3 constraint files are stored in `constrs` folder.
- Bitstream files are stored in the `build` folder.
