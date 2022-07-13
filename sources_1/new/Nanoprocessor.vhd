----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 06:46:46 AM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset, EN : in STD_LOGIC;
           Led_sum : out STD_LOGIC_VECTOR (3 downto 0);
           Led_zero : out STD_LOGIC;
           Led_carry : out STD_LOGIC);
end NanoProcessor;

architecture Behavioral of NanoProcessor is

-- The Register Bank
component RegBank
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
       RegSel : in STD_LOGIC_VECTOR (2 downto 0);
       Clk, Reset : in STD_LOGIC;
       I0, I1, I2, I3, I4, I5, I6, I7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- 8 way 4 bit MUXs
component Mux_8_to_1_4bit
Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC_VECTOR (2 downto 0));
end component;

-- RCA Adder / Subtracter
component RCA_4
Port ( 
    AddSubSel : in STD_LOGIC;
    A, B : in STD_LOGIC_VECTOR (3 downto 0); 
    S : out STD_LOGIC_VECTOR (3 downto 0);  
    C_out : out STD_LOGIC;
    Zero : out STD_LOGIC);
end component;

-- 2 way 4 bit MUX 
component MUX_2_to_1_4bit
Port ( I0, I1 : in STD_LOGIC_VECTOR (3 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (3 downto 0);
        S : in STD_LOGIC);
end component;

-- Instruction Decoder 
component Ins_Decoder
Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
       Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
       Immediate_Val : out STD_LOGIC_VECTOR (3 downto 0);
       Load_Sel : out STD_LOGIC;
       Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
       Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
       Add_Sub_Sel : out STD_LOGIC;
       Jump_Chk_Reg : in STD_LOGIC_VECTOR (3 downto 0);
       Jump_F : out STD_LOGIC := '0';
       Jump_address : out STD_LOGIC_VECTOR (2 downto 0):= "000");
end component;

-- 2 way 3 bit MUX
component MUX_2_to_1_3bit
Port ( I0, I1 : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (2 downto 0);
        S : in STD_LOGIC);
end component;

-- 3 bit Adder
component RCA_3
Port (A : in STD_LOGIC_VECTOR (2 downto 0); 
      S : out STD_LOGIC_VECTOR (2 downto 0)); 
end component;

-- Program Counter
component PC
Port ( Reset, En : in STD_LOGIC;
   Clk : in STD_LOGIC;
   A : in STD_LOGIC_VECTOR (2 downto 0);
   S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component LUT_3_12
Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
       D_out : out STD_LOGIC_VECTOR (11 downto 0));
end component;

------------- signals ----------------
signal Clk_out : STD_LOGIC;

----------- Register Bank and Instruction Decoder --------------
signal D: STD_LOGIC_VECTOR (3 downto 0);
signal RegSel : STD_LOGIC_VECTOR (2 downto 0);
signal I0,I1,I2,I3,I4,I5,I6,I7 : STD_LOGIC_VECTOR (3 downto 0);
----------------------------------------

----------- 8 way 4 bit MUXs and Instruction Decoder ------------
signal M0,M1,JumpCheckReg : STD_LOGIC_VECTOR (3 downto 0);
signal RegSelA, RegSelb : STD_LOGIC_VECTOR (2 downto 0);
-----------------------------------------

---------- RCA 4 bit and Instruction Decoder --------------------
signal AddSubSel : STD_LOGIC;
signal SumRCA : STD_LOGIC_VECTOR (3 downto 0);
-----------------------------------------------------------------

------- 2 way 4 bit MUX and Instruction Decoder -----------------
signal Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
signal LoadSel : STD_LOGIC;
-----------------------------------------------------------------

------ ROM and Instruction Decoder ----------------------------
signal Ins : STD_LOGIC_VECTOR(11 downto 0);
--------------------------------------------------------------

----- 2 way 3 bit and Instruction Register ----------------
signal JumpF : STD_LOGIC;
signal JumpAddress : STD_LOGIC_VECTOR(2 downto 0); 
---------------------------------------------------------------

----- 3 bit Adder and 2 way 3 bit MUX -------------------------
signal SumRCA3 : STD_LOGIC_VECTOR(2 downto 0);
---------------------------------------------------------------

----- Program Counter and 2 way 3 bit MUX ---------------------
signal PC_in : STD_LOGIC_VECTOR(2 downto 0);
---------------------------------------------------------------

----- 3 bit adder and Program Counter -------------------------
signal MemSel : STD_LOGIC_VECTOR(2 downto 0);
---------------------------------------------------------------


begin
-- Register Bank --
RegBank_0 : RegBank
PORT MAP(
    D=>D, RegSel=>RegSel, Clk=>Clk_out, Reset=>Reset,
    I0=>I0, I1=>I1, I2=>I2, I3=>I3, I4=>I4, I5=>I5, I6=>I6, I7=>I7
);
-------------------

-- 8 way 4 bit MUX 0 ---
Mux_8_to_1_4bit_0 : Mux_8_to_1_4bit
PORT MAP(
    I0=>I0, I1=>I1, I2=>I2, I3=>I3, I4=>I4, I5=>I5, I6=>I6, I7=>I7,
    EN =>EN,S => RegSelA, 
    Y=>M0 
);
------------------------

-- 8 way 4 bit MUX 1 ---
Mux_8_to_1_4bit_1 : Mux_8_to_1_4bit
PORT MAP(
    I0=>I0, I1=>I1, I2=>I2, I3=>I3, I4=>I4, I5=>I5, I6=>I6, I7=>I7,
    EN =>EN,S => RegSelB, 
    Y=>M1 
);
------------------------

------ RCAS 4 bit -------
RCA_4_0 : RCA_4
PORT MAP(
    AddSubSel => AddSubSel,
    A => M0, B=>M1,
    C_out =>Led_carry, S=>SumRCA, Zero => Led_zero
);
-------------------------

------- 2 way 4 bit Mux --------
Mux_2_to_1_4bit_0 : MUX_2_to_1_4bit
PORT MAP(
    EN => EN,
    I0=>Immediate_Value, I1=>SumRCA, Y=>D,
    S => LoadSel
);
---------------------------------

------ Instruction Decoder ------
Ins_Decoder_0 : Ins_Decoder
PORT MAP(
    Ins=>Ins,
    Jump_Chk_Reg=>JumpCheckReg,
    Reg_En=>RegSel,
    Reg_Sel_A=>RegSelA, Reg_Sel_B=>RegSelB, Add_Sub_Sel=>AddSubSel,
    Immediate_Val=>Immediate_Value, Load_Sel=>LoadSel,
    Jump_F => JumpF, Jump_address => JumpAddress
);
---------------------------------

-------- 3 bit adder -------------
RCA_3_0 : RCA_3
PORT MAP(
    A=>MemSel, S=>SumRCA3
    );
----------------------------------

------ 2 way 3 bit MUX -----------
MUX_2_to_1_3bit_0 : MUX_2_to_1_3bit
PORT MAP(
    EN=>EN,
    I1=>SumRCA3, I0=>JumpAddress,
    S => JumpF,
    Y => PC_in
);
----------------------------------

------- Program Counter ----------
PC_0 : PC
PORT MAP(
    En=>EN, Reset=>Reset,
    Clk=>Clk_out,
    A=>PC_in, S=>MemSel
   );

------- ROM ----------------
ROM : LUT_3_12
PORT MAP(
 address=>MemSel,
 D_out=>Ins
);
---------------------------

-- Output sum of Register 7 as the value --
Led_sum <= I7;
--- Jump Check Register
JumpCheckReg <= M0;

-- Clk signal
Clk_out <= Clk; 
end Behavioral;
