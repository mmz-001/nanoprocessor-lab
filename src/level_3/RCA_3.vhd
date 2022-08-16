library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RCA_3 is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           Carry_Out : out STD_LOGIC);
           
end RCA_3;

architecture Behavioral of RCA_3 is

signal D_out : STD_LOGIC_VECTOR (2 downto 0);

attribute use_dsp : string;
attribute use_dsp of D_out : signal is "yes";

begin

-- Add 1 to input
D_out <= D + '1';
Carry_out <= D_out(2);
Q <= D_out;

end Behavioral;
