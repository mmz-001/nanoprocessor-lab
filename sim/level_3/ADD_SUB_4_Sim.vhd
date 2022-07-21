
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_SUB_4_Sim is
end ADD_SUB_4_Sim;

architecture Behavioral of ADD_SUB_4_Sim is
  component ADD_SUB_4 
    Port (A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          Neg : in STD_LOGIC;
          S : out STD_LOGIC_VECTOR (3 downto 0);
          Overflow : out STD_LOGIC;
          Zero : out STD_LOGIC);
  end component;

  signal A, B, S : STD_LOGIC_VECTOR (3 downto 0);
  signal Neg, Overflow, Zero : STD_LOGIC;

begin

  uut: ADD_SUB_4
    port map (
      A => A,
      B => B,
      Neg => Neg,
      S => S,
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
