library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_4 is
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(3 downto 0));
end DFF_4;

architecture Behavioral of DFF_4 is

begin
    process (Clk) begin
        if (rising_edge(Clk)) then
            if Res = '1' then
                Q <= "0000";
            else
                Q <= D;
            end if;
        end if;
    end process;
end Behavioral;
