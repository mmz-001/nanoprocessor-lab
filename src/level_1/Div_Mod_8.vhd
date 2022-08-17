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
signal Div_Buffer, Mod_Buffer : STD_LOGIC_VECTOR (7 downto 0);

begin
    process(Div_Sel, Mod_Sel, A, B, Div_Buffer, Mod_Buffer)
        begin
        if (Div_Sel = '1') then
            -- Division by zero
            if (B = "00000000") then
                Flags <= "1000";
            else 
                Div_Buffer <= STD_LOGIC_VECTOR(signed(A) / signed(B));
                if (Div_Buffer = "00000000") then
                    Flags <= "0001";
                else    
                    Flags <= "0000";
                end if;
                Div_Out <= Div_Buffer;
            end if;
            
        elsif (Mod_Sel = '1') then
            -- Mod by zero
            if (B = "00000000") then
                Flags <= "1000";
            else 
                Mod_Buffer <= STD_LOGIC_VECTOR(signed(A) mod signed(B));
                if (Mod_Buffer = "00000000") then
                    Flags <= "0001";
                else    
                    Flags <= "0000";
                end if;
                Mod_Out <= Mod_Buffer;
            end if;
        else 
            Flags <= "0000";
        end if;

    end process;
end Behavioral;