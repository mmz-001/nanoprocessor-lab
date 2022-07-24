library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter_2 is
    Port( Clk_in : in STD_LOGIC;
          Q : out STD_LOGIC_VECTOR(1 downto 0) := "00" );
end Counter_2;

architecture Behavioral of Counter_2 is

    signal Count : integer := 1;
    signal State : integer := 0;

begin
    process (Clk_In) begin
        if (rising_edge(Clk_In)) then
            Count <= Count + 1;
            if (Count = 2) then -- Count 5000 cycles to keep clock cycle to 1 ms seconds
                State <= State+1;
                if(State=1) then
                    Q <= "00";
                elsif(State=2) then
                    Q <= "01";
                elsif(State=3) then
                    Q <= "10";
                elsif(State=4) then
                    Q <= "11";
                    State <= 0;
                end if;

                Count <= 1;
            end if;
        end if;
    end process;


end Behavioral;