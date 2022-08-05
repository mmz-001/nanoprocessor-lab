library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity MUL_8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           FLAG : out STD_LOGIC_VECTOR (3 downto 0));
end MUL_8;

architecture Behavioral of MUL_8 is

signal A_Cut, B_Cut : STD_LOGIC_VECTOR (3 downto 0);
signal Q_Buffer : STD_LOGIC_VECTOR (7 downto 0);

begin

A_Cut <= A (3 downto 0);
B_Cut <= B (3 downto 0);
Q_Buffer <= STD_LOGIC_VECTOR(signed(A_Cut) * signed(B_Cut));
Q <= Q_Buffer;

FLAG (0) <= Q_Buffer(7) XOR Q_Buffer(6); -- Overflow 
FLAG (1) <= not(Q_Buffer(0) or Q_Buffer(1) or Q_Buffer(2) or Q_Buffer(3) or Q_Buffer(4) or Q_Buffer(5) or Q_Buffer(6) or Q_Buffer(7)); -- Zero 
FLAG (2) <= Q_Buffer(7); -- Negative 
FLAG (3) <= '0'; -- Interrupt, have to map this to something. 


end Behavioral;