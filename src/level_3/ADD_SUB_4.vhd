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
signal A_signed, B_signed, Sum_out : integer range -8 to 7;
signal Neg_sig : integer range -1 to 0;

attribute use_dsp : string;
attribute use_dsp of A_signed, B_signed, Sum_out : signal is "yes";

begin
  
  process(A_signed,B_signed,Neg,Sum_out,Neg_sig,A,B) begin
    A_signed <= to_integer(signed(A));
    B_signed <= to_integer(signed(B));

    Neg_sig <= to_integer(unsigned'('0' & Neg));

    Sum_out <= A_signed + (Neg_sig*(-2) +1) * B_signed;
    
    if(Sum_out=0) then
      Zero <= '1';
    else
      Zero <= '0';
    end if;
      
    end process;
    
  Sum <= STD_LOGIC_VECTOR(to_signed(Sum_out, Sum'length));
  Overflow <= (A(3) AND B(3)) XOR (A(2) AND B(2));

end Behavioral;
