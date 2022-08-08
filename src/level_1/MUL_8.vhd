library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity MUL_8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Mul_Sel : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           FLAG : out STD_LOGIC_VECTOR (3 downto 0));
end MUL_8;

architecture Behavioral of MUL_8 is

signal Q_out, Q_overflow : STD_LOGIC_VECTOR (7 downto 0);
signal Q_Buffer : STD_LOGIC_VECTOR (15 downto 0);


begin

Q_Buffer <= STD_LOGIC_VECTOR(signed(A) * signed(B));
Q_out <= Q_Buffer(7 downto 0);
Q_overflow <= Q_Buffer(15 downto 8);

process (Mul_Sel,Q_out) begin
    
    if Mul_Sel = '0' then
        Q <= "00000000";
        FLAG <= "0000";
    else
        Q <= Q_out;        
        FLAG (0) <= Q_overflow(0) xor Q_overflow(1) xor Q_overflow(2) xor Q_overflow(3) xor Q_overflow(4) xor Q_overflow(5) xor Q_overflow(6) xor Q_overflow(7); -- overflow
        FLAG (1) <= not(Q_out(0) or Q_out(1) or Q_out(2) or Q_out(3) or Q_out(4) or Q_out(5) or Q_out(6) or Q_out(7)); -- Zero 
        FLAG (2) <= Q_out(7); -- Negative 
        FLAG (3) <= '0'; -- Interrupt, have to map this to something. 
    end if;
    
end process;
end Behavioral;