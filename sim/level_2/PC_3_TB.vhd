library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_3_TB is
end PC_3_TB;

architecture Behavioral of PC_3_TB is
  component PC_3
      Port (
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Addr_Jump : in STD_LOGIC_VECTOR(2 downto 0);
        Q_last : in STD_LOGIC_VECTOR(2 downto 0);
        Jump_Flag : in STD_LOGIC; 
        Q : out STD_LOGIC_VECTOR (2 downto 0)
    );
  end component;

  signal Res, Clk : STD_LOGIC := '0';
  signal Jump_Flag : STD_LOGIC;
  signal Addr_Jump, Q_last, Q : STD_LOGIC_VECTOR (2 downto 0);

begin

  uut: PC_3
    port map (
      Res => Res,
      Clk => Clk,
      Addr_Jump => Addr_Jump,
      Q_last => Q_last,
      Jump_Flag => Jump_Flag,
      Q => Q
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
    Addr_Jump<="011";
    Jump_Flag<='0'; 
    Q_last <= "000";
    wait for 40 ns;

    Q_last <= "010";
    wait for 40 ns;
    
    Q_last <= "111";
    wait for 40 ns;

    Q_last <= "110";
    Jump_Flag<='1';
    wait for 40 ns;

    Res <= '1';
    wait;

  end process;

end Behavioral;
