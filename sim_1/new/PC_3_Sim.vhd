library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_3_Sim is
end PC_3_Sim;

architecture Behavioral of PC_3_Sim is
  component PC_3
    Port (Res : in STD_LOGIC;
          Clk : in STD_LOGIC;
          D : in STD_LOGIC_VECTOR (2 downto 0);
          M : out STD_LOGIC_VECTOR (2 downto 0)
  );
  end component;

  signal Res, Clk : STD_LOGIC := '0';
  signal D, M : STD_LOGIC_VECTOR (2 downto 0);

begin

  uut: PC_3
    port map (
      Res => Res,
      Clk => Clk,
      D => D,
      M => M
    );

  process begin
    wait for 20 ns;
    Clk <= NOT (Clk);
  end process;

  process begin
    -- Index number 200336M - 00 110 000 111 010 010 000

    Res <= '1';
    wait for 30 ns;

    Res <= '0';
    D <= "000";
    wait for 40 ns;

    D <= "010";
    wait for 40 ns;

    D <= "111";
    wait for 40 ns;

    D <= "110";
    wait for 40 ns;

    Res <= '1';
    wait;

  end process;

end Behavioral;
