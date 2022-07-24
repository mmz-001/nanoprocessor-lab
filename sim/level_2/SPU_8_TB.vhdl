library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPU_8_TB is
end SPU_8_TB;

architecture Behavioral of SPU_8_TB is
    component SPU_8
        Port (  I : in STD_LOGIC_VECTOR (7 downto 0);
                Flags : in STD_LOGIC_VECTOR (3 downto 0);
                Clk_in : in STD_LOGIC;
                D : out STD_LOGIC_VECTOR (6 downto 0);
                Q_Anode : out STD_LOGIC_VECTOR (1 downto 0));
    end component;

    signal I : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal Flags : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Clk : STD_LOGIC := '0';
    signal D : STD_LOGIC_VECTOR (6 downto 0);
    signal Q_Anode : STD_LOGIC_VECTOR (1 downto 0);

    begin

    UUT : SPU_8
        Port Map(
            I => I,
            Flags => Flags,
            Clk_in => Clk,
            D => D,
            Q_Anode => Q_Anode );

        process
        begin
            wait for 5 ns;
            Clk <= NOT Clk;
        end process;

        process
        begin
           I <= "00000000";
           Flags <= "0001";    -- Overflow
           wait for 100 ns;
            
            I <= "00000000";
            Flags <= "0010";    -- Zero
            wait for 100 ns;

            I <= "11110000";
            Flags <= "0000";    -- No Flags set
            wait for 100 ns;

            I <= "11110000";
            Flags <= "0100";    -- Negative
            wait for 100 ns;

            I <= "11110000";
            Flags <= "1000";    -- Interrupt
            wait for 100 ns;
        end process;

end Behavioral;