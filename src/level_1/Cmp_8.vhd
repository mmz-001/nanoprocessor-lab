library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Cmp_8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cmp_Sel : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           Flags : out STD_LOGIC_VECTOR (3 downto 0));
end Cmp_8;

architecture Behavioral of Cmp_8 is


begin
    process (A, B, Cmp_Sel) begin
        Q <= "00000000";
        if (Cmp_Sel = '1') then
            if (A = B) then
                Flags <= "0010";
            elsif (A < B) then
                Flags <= "0100";
            else
                Flags <= "0000";
            end if;
        else
            Flags <= "0000";
        end if;
    end process;
end Behavioral;