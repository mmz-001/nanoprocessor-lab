----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 10:42:06 PM
-- Design Name: 
-- Module Name: Ins_Decoder - Behavioral
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

entity Ins_Decoder is
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
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is
signal choice : STD_LOGIC_VECTOR (1 downto 0);
begin

process(Ins)
begin
    choice <= Ins(11 downto 10);
    if(choice="11") then
        Jump_F <= '1';
        Jump_address <= Ins(2 downto 0);
    else
        -- Load Select
        Load_Sel <= Ins(11) AND (NOT(Ins(10)));
        -- Add Sub Select
        Add_Sub_Sel <= Ins(10) AND (NOT(Ins(11)));
        -- Immediate Value
        Immediate_Val <= Ins(3 downto 0);
        -- Enable register to store the output
        Reg_En <= Ins(9 downto 7);
        -- Register A
        Reg_Sel_A <= Ins(9 downto 7);
        -- Register B
        Reg_Sel_B <= Ins(6 downto 4);
    end if;
 end process;
end Behavioral;
