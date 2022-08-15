library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_8 is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end Reg_8;

architecture Behavioral of Reg_8 is

begin
    process (Clk) begin
        if (rising_edge(Clk)) then 
            if Res = '1' then   
                Q <= "00000000"; -- reset to 00000000 when Res is 1 
            elsif En = '1' then
                Q <= D ; -- store data when enable is 1         
            end if;           
        end if;
    end process;

end Behavioral;