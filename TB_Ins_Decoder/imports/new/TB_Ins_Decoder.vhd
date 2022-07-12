----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 11:36:46 PM
-- Design Name: 
-- Module Name: TB_Ins_Decoder - Behavioral
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

entity TB_Ins_Decoder is
--  Port ( );
end TB_Ins_Decoder;

architecture Behavioral of TB_Ins_Decoder is

component Ins_Decoder
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Immediate_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Load_Sel : out STD_LOGIC;
           Reg_Sel_A, Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           Jump_Chk_Reg : in STD_LOGIC_VECTOR (3 downto 0);
           Jump_F : out STD_LOGIC;
           Jump_address : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Ins : STD_LOGIC_VECTOR (11 downto 0);
signal Jump_Chk_Reg, Immediate_Val : STD_LOGIC_VECTOR (3 downto 0);
signal Load_Sel, Add_Sub_Sel, Jump_F : STD_LOGIC;
signal Reg_En, Reg_Sel_A, Reg_Sel_B, Jump_address : STD_LOGIC_VECTOR (2 downto 0);


begin

UUT : Ins_Decoder
    PORT MAP(
        Ins => Ins, Immediate_Val => Immediate_Val,
        Jump_Chk_Reg => Jump_Chk_Reg, Jump_address => Jump_address,
        Load_Sel => Load_Sel, Jump_F => Jump_F, Add_Sub_Sel => Add_Sub_Sel,
        Reg_En => Reg_En, Reg_Sel_A => Reg_Sel_A, Reg_Sel_B => Reg_Sel_B
    );
    
process
begin
    -- MOVI R,d -- 10 001 000 0001
    Ins <= "100010000001"; 
    wait for 100 ns;
    -- MOVI R,d -- 10 010 000 0010
    Ins <= "100100000010"; 
    wait for 100 ns;
    
    -- Add Ra, Rb -- 00 001 010 0000
    Ins <= "000010100000";
    wait for 100 ns;
    
    -- Neg Ra -- 01 010 000 0000
    Ins <= "010100000000";
    wait for 100 ns;
    
    -- JZR R, d -- 11 011 000 0001
    Ins <= "110110000001";
    wait for 10 ns;
    Jump_Chk_Reg <= "0000";
    wait for 90 ns;   
    
end process;
end Behavioral;
