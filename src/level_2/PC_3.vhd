library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_3 is
  Port (Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (2 downto 0);
        Q : out STD_LOGIC_VECTOR (2 downto 0)
   );
  end PC_3;

architecture Behavioral of PC_3 is

  component DFF_4 
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC);
  end component;

begin
  DFF_4_0 : DFF_4
    port map (
      D => D(0),
      Res => Res,
      Clk => Clk,
      Q => Q(0)
    );

  DFF_4_1 : DFF_4
    port map (
      D => D(1),
      Res => Res,
      Clk => Clk,
      Q => Q(1)
    );

  DFF_4_2 : DFF_4
    port map (
      D => D(2),
      Res => Res,
      Clk => Clk,
      Q => Q(2)
    );

end Behavioral;
