library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_5_TB is
end PC_5_TB;

architecture Behavioral of PC_5_TB is
  component PC_5
    Port (Res : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Addr_Jump : in STD_LOGIC_VECTOR (4 downto 0);
          Jump_Flag : in STD_LOGIC; 
          M : out STD_LOGIC_VECTOR (4 downto 0)
    );
  end component;

  signal Res, Clk : STD_LOGIC := '0';
  signal Jump_Flag : STD_LOGIC;
  signal Addr_Jump, M : STD_LOGIC_VECTOR (4 downto 0);

begin

  uut: PC_5
    port map (
      Res => Res,
      Clk => Clk,
      Addr_Jump => Addr_Jump,
      Jump_Flag => Jump_Flag,
      M => M
    );

  process begin
    wait for 20 ns;
    Clk <= NOT (Clk);
  end process;

  process begin

    Res <= '1';
    Addr_Jump <= "00000";
    Jump_Flag <= '0';
    wait for 30 ns;

    Res <= '0';
    wait for 200 ns;

    Addr_Jump <= "00010";
    Jump_Flag <= '0';
    wait for 100 ns;

    Addr_Jump <= "00011";
    Jump_Flag <= '1';
    wait for 100 ns;

    Res <= '1';
    wait;



  end process;

end Behavioral;
