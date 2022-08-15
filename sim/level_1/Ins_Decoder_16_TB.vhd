library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ins_Decoder_16_TB is

end Ins_Decoder_16_TB;

architecture Behavioral of Ins_Decoder_16_TB is
component Ins_Decoder_16
  Port (
    I : in STD_LOGIC_VECTOR (15 downto 0); -- 16 bit instruction
    R_In : in STD_LOGIC_VECTOR (7 downto 0);  -- Input Register
    Zero, Overflow, Negative, Interrupt : in STD_LOGIC;
    R_En, RA_Sel, RB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
    Jmp_Flag : out STD_LOGIC;
    AU_Sel: out STD_LOGIC_VECTOR (2 downto 0);
    Load_Sel : out STD_LOGIC_VECTOR ( 1 downto 0);
    Jmp_Addr : out STD_LOGIC_VECTOR (4 downto 0);
    Im_Val : out STD_LOGIC_VECTOR (7 downto 0));
end component;

Signal I : STD_LOGIC_VECTOR (15 downto 0); -- 16 bit instruction
Signal R_In : STD_LOGIC_VECTOR (7 downto 0);  -- Input Register
Signal Zero, Overflow, Negative, Interrupt : STD_LOGIC;
Signal R_En, RA_Sel, RB_Sel : STD_LOGIC_VECTOR (2 downto 0);
Signal Jmp_Flag : STD_LOGIC;
Signal AU_Sel: STD_LOGIC_VECTOR (2 downto 0);
Signal Load_Sel : STD_LOGIC_VECTOR ( 1 downto 0);
Signal Jmp_Addr : STD_LOGIC_VECTOR (4 downto 0);
Signal Im_Val : STD_LOGIC_VECTOR (7 downto 0);

begin
UUT: Ins_Decoder_16
port map(
    I => I,
    R_In =>R_In,
    Zero =>Zero,
    Overflow =>Overflow,
    Negative =>Negative,
    Interrupt =>Interrupt,
    R_En => R_En,
    RA_Sel => RA_Sel,
    RB_Sel => RB_Sel,
    JMP_Flag => Jmp_Flag,
    AU_Sel => AU_Sel,
    Load_Sel => Load_Sel,
    Jmp_Addr => Jmp_Addr,
    Im_Val => Im_Val);

process
begin

-- setting flag inputs to zero 
Zero <= '0';
Overflow <= '0';
Negative <= '0';
Interrupt <= '0';
R_In <= "00000000";

-- MOVI, register 8 (111), value = 10 (00001010)
I <= "0010111000001010";
wait for 50 ns;

-- ADD, reg 2 (010), reg 3 (011)
I <= "0000010011000000";
wait for 50 ns;

-- NEG, reg 6 (101) 
I <= "0001101000000000";
wait for 50 ns;

-- JRZ, reg 5 (100), addr (01010)
I <= "0011100000001010";
wait for 50 ns;
R_In <= "00000001"; -- testing jrz when R_in != 0
wait for 50 ns;

wait;
end process;
end Behavioral;