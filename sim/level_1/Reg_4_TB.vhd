library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_4_TB is
end Reg_4_TB;

architecture Behavioral of Reg_4_TB is
  component Reg_4
    Port (D : in STD_LOGIC_VECTOR (3 downto 0);
          Res : in STD_LOGIC;
          Clk : in STD_LOGIC;
          En : in STD_LOGIC;
          Q : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  signal Clk : STD_LOGIC := '0';
  signal En, Res : STD_LOGIC;
  signal D, Q : STD_LOGIC_VECTOR (3 downto 0);
  
  

begin
  uut : Reg_4
    port map(
      D => D,
      Res => Res,
      Clk => Clk,
      En => En,
      Q => Q
    );

  process begin
    wait for 20 ns;
    Clk <= NOT(Clk);
  end process;

  process begin
    -- Index number 200588K - 0011 0000 1111 1000 1100

    Res <= '1';
    wait for 30 ns;

    Res <= '0'; 
    En <= '1';
    D <= "1100";
    wait for 40 ns;

    D <= "1000";
    wait for 40 ns;

    D <= "1111";
    En <= '0';
    wait for 40 ns;

    Res <= '1';
    wait;

  end process;


end Behavioral;
