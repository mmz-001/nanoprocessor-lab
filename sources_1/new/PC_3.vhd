library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_3 is
  Port (Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (2 downto 0);
        M : out STD_LOGIC_VECTOR (2 downto 0)
   );
  end PC_3;

architecture Behavioral of PC_3 is

  component D_FF 
    Port (D : in STD_LOGIC;
          Res : in STD_LOGIC;
          Clk : in STD_LOGIC;
          M : out STD_LOGIC;
          Mbar : out STD_LOGIC);
  end component;

begin
  D_FF_0 : D_FF
    port map (
      D => D(0),
      Res => Res,
      Clk => Clk,
      M => M(0)
    );

  D_FF_1 : D_FF
    port map (
      D => D(1),
      Res => Res,
      Clk => Clk,
      M => M(1)
    );

  D_FF_2 : D_FF
    port map (
      D => D(2),
      Res => Res,
      Clk => Clk,
      M => M(2)
    );

end Behavioral;
