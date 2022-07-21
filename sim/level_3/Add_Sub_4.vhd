
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub_4_TB is
end Add_Sub_4_TB;

architecture Behavioral of Add_Sub_4_TB is
  component Add_Sub_4 
    Port (A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          Neg : in STD_LOGIC;
          Sum : out STD_LOGIC_VECTOR (3 downto 0);
          Overflow : out STD_LOGIC;
          Zero : out STD_LOGIC);
  end component;

  signal A, B, Sum : STD_LOGIC_VECTOR (3 downto 0);
  signal Neg, Overflow, Zero : STD_LOGIC;

begin

  uut: Add_Sub_4
    port map (
      A => A,
      B => B,
      Neg => Neg,
      Sum => Sum,
      Overflow => Overflow,
      Zero => Zero
    );

  process begin
  -- Index Number
  -- 200588 - 0011 0000 1111 1000 1100

    A <= "1100";
    B <= "1000";
    Neg <= '0';
    wait for 150 ns;

    A <= "1100";
    B <= "1000";
    Neg <= '1';
    wait for 150 ns;

    A <= "0000";
    B <= "1111";
    Neg <= '0';
    wait for 150 ns;

    A <= "0000";
    B <= "1111";
    Neg <= '1';
    wait for 150 ns;

    A <= "0011";
    B <= "0011";
    Neg <= '0';
    wait for 150 ns;

    A <= "0011";
    B <= "0011";
    Neg <= '1';
    wait;

  end process;


end Behavioral;
