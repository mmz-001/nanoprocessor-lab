library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SGA_8 is
    Port( Clk_In : in STD_LOGIC;
          Hundreds, Tens, Ones : in STD_LOGIC_VECTOR(3 downto 0);
          Sign : in STD_LOGIC;
          Anode_Out_L : out STD_LOGIC_VECTOR(3 downto 0);
          Seven_Seg_Out_L : out STD_LOGIC_VECTOR(7 downto 0));
end SGA_8;

architecture Behavioral of SGA_8 is

signal Count : STD_LOGIC_VECTOR (1 downto 0);
begin

end Behavioral;