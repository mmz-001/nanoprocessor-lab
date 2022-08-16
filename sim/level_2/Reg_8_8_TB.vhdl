library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_8_8_TB is
end Reg_8_8_TB;

architecture Behavioral of Reg_8_8_TB is
    component Reg_8_8
        Port (
            Res : in STD_LOGIC;
            R_En : in STD_LOGIC_VECTOR (2 downto 0); -- regeister select
            Clk : in STD_LOGIC;
            R_In : in STD_LOGIC_VECTOR (7 downto 0); -- data in
            R_0 : out STD_LOGIC_VECTOR (7 downto 0); -- 8 bit regsiters
            R_1 : out STD_LOGIC_VECTOR (7 downto 0);
            R_2 : out STD_LOGIC_VECTOR (7 downto 0);
            R_3 : out STD_LOGIC_VECTOR (7 downto 0);
            R_4 : out STD_LOGIC_VECTOR (7 downto 0);
            R_5 : out STD_LOGIC_VECTOR (7 downto 0);
            R_6 : out STD_LOGIC_VECTOR (7 downto 0);
            R_7 : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    signal Clk : STD_LOGIC := '0';
    signal Res : STD_LOGIC;
    signal R_En : STD_LOGIC_VECTOR(2 downto 0);
    signal R_In, R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7 : STD_LOGIC_VECTOR (7 downto 0);

begin
    UUT : Reg_8_8
        port map(
            Res => Res,
            R_En => R_En,
            Clk => Clk,
            R_In => R_In,
            R_0 => R_0,
            R_1 => R_1,
            R_2 => R_2,
            R_3 => R_3,
            R_4 => R_4,
            R_5 => R_5,
            R_6 => R_6,
            R_7 => R_7
        );

    -- Clock signal
    process
    begin
        wait for 20 ns;
        Clk <= NOT (Clk);
    end process;

    process
    begin
        Res <= '1';
        wait for 100 ns;
        Res <= '0';
        wait for 20 ns;

        -- Give input 1 to each register
        R_In <= "00000001";
        
        R_En <= "000";
        wait for 100 ns;
        R_En <= "001";
        wait for 100 ns;
        R_En <= "010";
        wait for 100 ns;
        R_En <= "011";
        wait for 100 ns;
        R_En <= "100";
        wait for 100 ns;
        R_En <= "101";
        wait for 100 ns;
        R_En <= "110";
        wait for 100 ns;
        R_En <= "111";
        wait for 100 ns;
        
        wait;

    end process;
end Behavioral;
