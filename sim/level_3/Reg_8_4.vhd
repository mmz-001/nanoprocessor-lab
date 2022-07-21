library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_8_4 is
end Reg_8_4;

architecture Behavioral of Reg_8_4 is
  component Reg_8_4
    port (Res : in STD_LOGIC;
          R_En : in STD_LOGIC_VECTOR (2 downto 0);
          Clk : in STD_LOGIC;
          R_In : in STD_LOGIC_VECTOR (3 downto 0);
          R_0 : out STD_LOGIC_VECTOR (3 downto 0);
          R_1 : out STD_LOGIC_VECTOR (3 downto 0);
          R_2 : out STD_LOGIC_VECTOR (3 downto 0);
          R_3 : out STD_LOGIC_VECTOR (3 downto 0);
          R_4 : out STD_LOGIC_VECTOR (3 downto 0);
          R_5 : out STD_LOGIC_VECTOR (3 downto 0);
          R_6 : out STD_LOGIC_VECTOR (3 downto 0);
          R_7 : out STD_LOGIC_VECTOR (3 downto 0)
    );
  end component;

  signal Res : STD_LOGIC;
  signal Clk : STD_LOGIC := '0';
  signal R_En : STD_LOGIC_VECTOR (2 downto 0);
  signal R_In, R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7 : STD_LOGIC_VECTOR (3 downto 0);


begin
  uut : Reg_8_4
    port map (
      Res => Res,
      Clk => Clk,
      R_In => R_In, 
      R_En => R_En,
      R_0 => R_0,  
      R_1 => R_1,  
      R_2 => R_2,  
      R_3 => R_3,  
      R_4 => R_4,  
      R_5 => R_5,  
      R_6 => R_6,  
      R_7 => R_7 
    );

  process begin
    wait for 20 ns;
    Clk <= NOT(Clk);
  end process;

  process begin
    -- Index Number 200189M -        0011 0000 1101 1111 1101
    -- Index Number 200189E - 00 110  000  110  111  111  101

    Res <= '1';
    wait for 40 ns;

    Res <= '0';
    R_In <= "1100";
    R_En <= "101";
    wait for 40 ns;

    R_In <= "1111";
    R_En <= "111";
    wait for 40 ns;

    R_In <= "1101";
    R_En <= "111";
    wait for 40 ns;

    R_In <= "0000";
    R_En <= "110";
    wait for 40 ns;

    Res <= '1';
    wait for 40 ns;

    Res <= '0';
    R_In <= "0011";
    R_En <= "000";  -- R0 is hardcoded to "0000"
    wait;

  end process;
end Behavioral;
