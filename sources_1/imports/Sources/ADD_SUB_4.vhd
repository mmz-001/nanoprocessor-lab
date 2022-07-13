library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_SUB_4 is
  Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         Neg : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR (3 downto 0);
         Overflow : out STD_LOGIC;
         Zero : out STD_LOGIC);
end ADD_SUB_4;

architecture Behavioral of ADD_SUB_4 is
  component FA
  port (
      A, B, C_in: in std_logic;
      S, C_out: out std_logic
  );
  end component;

  signal C0 : std_logic;
  signal C1 : std_logic;
  signal C2 : std_logic;
  signal C3 : std_logic;
  signal B_Neg : STD_LOGIC_VECTOR (3 downto 0);
  signal S_Out : STD_LOGIC_VECTOR (3 downto 0);
  
begin

  B_Neg(0) <=  B(0) XOR Neg;
  B_Neg(1) <=  B(1) XOR Neg;
  B_Neg(2) <=  B(2) XOR Neg;
  B_Neg(3) <=  B(3) XOR Neg;
  
  -- B    Neg
  -- 1 xor 1 = 0 
  -- 0 xor 1 = 1 
  -- 1 xor 0 = 1 -- no change 
  -- 0 xor 0 = 0 -- no change 

  FA_0 : FA
    port map (
      A => A(0),
      B => B_Neg(0),
      C_in => Neg,
      S => S_Out(0),
      C_Out => C0
    );
  
  FA_1 : FA
    port map (
      A => A(1),
      B => B_Neg(1),
      C_in => C0,
      S => S_Out(1),
      C_Out => C1
    );
  
  FA_2 : FA
    port map (
      A => A(2),
      B => B_Neg(2),
      C_in => C1,
      S => S_Out(2),
      C_Out => C2
    );  

  FA_3 : FA
    port map (
      A => A(3),
      B => B_Neg(3),
      C_in => C2,
      S => S_Out(3),
      C_Out => C3
    );
  
  Overflow <= C3 XOR C2;
  Zero <= NOT (S_Out(0) OR S_Out(1) OR S_Out(2) or S_Out(3));
  S <= S_Out;

end Behavioral;
