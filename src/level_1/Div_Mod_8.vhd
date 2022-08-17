library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Div_Mod_8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Div_Sel : in STD_LOGIC;
           Mod_Sel : in STD_LOGIC;
           Div_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Mod_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Flags : out STD_LOGIC_VECTOR (3 downto 0));
end Div_Mod_8;

architecture Behavioral of Div_Mod_8 is


begin
    process(Div_Sel, Mod_Sel, A, B)
        begin
        if (Div_Sel = '1') then
            -- Division by zero
            if (B = "00000000") then
                Flags <= "1000";
            else 
                Div_Out <= STD_LOGIC_VECTOR(signed(A) / signed(B));
                Flags <= "0000";
            end if;
            
        elsif (Mod_Sel = '1') then
            -- Mod by zero
            if (B = "00000000") then
                Flags <= "1000";
            else 
                Mod_Out <= STD_LOGIC_VECTOR(signed(A) mod signed(B));
                Flags <= "0000";
            end if;
        else 
            Flags <= "0000";
        end if;

    end process;
end Behavioral;