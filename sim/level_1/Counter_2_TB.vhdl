library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter_2_TB is
end Counter_2_TB;

architecture Behavioral of Counter_2_TB is
    component Counter_2
        Port( Clk_In : in STD_LOGIC;
              Q : out STD_LOGIC_VECTOR(1 downto 0) );
    end component;

signal Clk: STD_LOGIC := '0';
signal Q : STD_LOGIC_VECTOR(1 downto 0); 

begin

UUT : Counter_2
    Port Map(
        Clk_in => Clk,
        Q => Q
    );

    -- sim of on board clock signal
    process
    begin
        wait for 20 ns;
        Clk <= NOT Clk;
    end process;

end Behavioral;