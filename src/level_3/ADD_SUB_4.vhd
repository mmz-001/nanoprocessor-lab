library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Add_Sub_4 is
  Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         Neg : in STD_LOGIC;
         Sum : out STD_LOGIC_VECTOR (3 downto 0);
         Overflow : out STD_LOGIC;
         Zero : out STD_LOGIC);
end Add_Sub_4;

architecture Behavioral of Add_Sub_4 is

begin

  process(A,B,Neg) begin
    if(Neg='0') then
      Sum <= STD_LOGIC_VECTOR(signed(A) + signed(B));
    else
      Sum <= STD_LOGIC_VECTOR(signed(A) - signed(B));
    end if;
    Overflow <= (A(3) AND B(3)) XOR (A(2) AND B(2));
    Zero <= NOT ((A(0) XOR B(0)) OR (A(1) XOR B(1)) OR (A(2) XOR B(2)) or (A(3) XOR B(3)));
    
  end process;
  

end Behavioral;
