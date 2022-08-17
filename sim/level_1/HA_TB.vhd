library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA_TB is
end HA_TB;

architecture Behavioral of HA_TB is
    -- The Half Adder Component 
    component HA
        Port ( 
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Carry : out STD_LOGIC;
            Sum : out STD_LOGIC);
    end component;
    
    signal gA, gB : STD_LOGIC;
    signal gS, gC : STD_LOGIC;
begin

-- UUT = HA Test the Half Adder
UUT : HA
    PORT MAP(
        A => gA,
        B => gB,
        Sum => gS,
        Carry => gC
    );
    
 -- begin simulating the HA
 process
 begin
    -- 00
    gA <= '0';
    gB <= '0';
    wait for 100 ns;
    
    -- 01
    gB <= '1';
    wait for 100 ns;
    
    -- 11
    gA <= '1';
    wait for 100 ns;
  
    -- 10
    gB <= '0';
    wait for 100 ns;
    
 end process;

end Behavioral;
