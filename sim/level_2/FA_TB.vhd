library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_TB is
--  Port ( );
end FA_TB;

architecture Behavioral of FA_TB is
    -- Full Adder component
    component FA
        Port ( 
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Carry_In : in STD_LOGIC;
            Sum : out STD_LOGIC;
            Carry_Out : out STD_LOGIC);
    end component;
    
    signal gA, gB, gC_in : STD_LOGIC;
    signal gS, gC_out: STD_LOGIC;
begin

-- UUT - Full Adder
UUT : FA
    PORT MAP(
        A => gA,
        B => gB,
        Carry_In => gC_in,
        Sum => gS,
        Carry_Out => gC_out
    );

    process
    begin
    -- 000
    gA <= '0';
    gB <= '0';
    gC_in <= '0';
    wait for 100 ns;
    
    -- 001
    gC_in <= '1';
    wait for 100 ns;
    
    -- 011
    gB <= '1';
    wait for 100 ns;
    
    -- 010
    gC_in <= '0';
    wait for 100 ns;
    
    -- 110
    gA <= '1';
    wait for 100 ns;
    
    -- 111
    gC_in <= '1';
    wait for 100 ns;
    
    -- 101
    gB <= '0';
    wait for 100 ns;
    
    -- 100
    gC_in <= '0';
    wait for 100 ns;
    
    end process;
    
end Behavioral;
