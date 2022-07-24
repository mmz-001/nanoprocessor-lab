library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPU_8 is
    Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
           Flags : in STD_LOGIC_VECTOR (3 downto 0);
           Clk_in : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (6 downto 0);
           Q_Anode : out STD_LOGIC_VECTOR (1 downto 0));
end SPU_8;

architecture Behavioral of SPU_8 is
    component Counter_2
        Port( Clk_in : in STD_LOGIC;
              Q : out STD_LOGIC_VECTOR(1 downto 0) := "00" );
    end component;
    
    type rom_type_dec is array (0 to 9) of STD_LOGIC_VECTOR(6 downto 0);
    type rom_type_flags is array(0 to 7) of STD_LOGIC_VECTOR(6 downto 0);
        signal sevenSegment_ROM_Dec : rom_type_dec :=(
                "1000000",-- 0
                "1111001",-- 1
                "0100100",-- 2
                "0110000",-- 3
                "0011001",-- 4
                "0010010",-- 5
                "0000010",-- 6
                "1111000",-- 7
                "0000000",-- 8
                "0010000"-- 9
            );

            signal sevenSegment_ROM_Flag : rom_type_flags :=(
                "0111111",-- -
                "0100011",-- o
                "1100011",-- v
                "0101111",-- r
                "0001110",-- F
                "0100001",-- d
                "1111011", -- i
                "1111111" -- Off
            );
 
    signal ones, tens, hundreds : integer := 0;
    signal Anode : STD_LOGIC_VECTOR (1 downto 0) := "00";
    
begin
    Counter : Counter_2
        Port Map(
            Clk_in => Clk_in,
            Q => Anode );
    
    process(I, Flags, Anode) begin
        -- Overflow flag set
        if (Flags="0001") then
            if (Anode="00") then
                D <= sevenSegment_ROM_Flag(4);
            elsif(Anode="01") then    
                D <= sevenSegment_ROM_Flag(3);
            elsif(Anode="10") then
                D <= sevenSegment_ROM_Flag(2);
            elsif(Anode="11") then
                D <= sevenSegment_ROM_Flag(1);
            end if;
        -- Zero flag set
        elsif (Flags="0010") then
            D <= sevenSegment_ROM_Dec(0);

        -- Interrupt flag set
        elsif (Flags="1000") then
            if (Anode="00") then
                D <= sevenSegment_ROM_Dec(0);
            elsif(Anode="01") then    
                D <= sevenSegment_ROM_Flag(2);
            elsif(Anode="10") then
                D <= sevenSegment_ROM_Flag(6);
            elsif(Anode="11") then
                D <= sevenSegment_ROM_Flag(5);
            end if;
        
        -- Negative flag set
        elsif (Flags="0100") then
            ones <= to_integer(signed(I)) rem 10;
            tens <= (to_integer(signed(I)) rem 100) - ones;
            hundreds <= (to_integer(signed(I)) rem 1000) - (hundreds + ones); 

            if (Anode="00") then
                D <= sevenSegment_ROM_Dec(ones);
            elsif(Anode="01") then    
                D <= sevenSegment_ROM_Dec(tens);
            elsif(Anode="10") then
                D <= sevenSegment_ROM_Dec(hundreds);
            elsif (Anode="11") then
                D <= sevenSegment_ROM_Flag(0);
            end if;

        -- No overflow, interrupt or zero flags are set
        else
            ones <= to_integer(unsigned(I) rem 10);
            tens <= (to_integer(unsigned(I)) rem 100) - ones;
            hundreds <= (to_integer(unsigned(I)) rem 1000) - (hundreds + ones); 
            
            if (Anode="00") then
                D <= sevenSegment_ROM_Dec(ones);
            elsif(Anode="01") then    
                D <= sevenSegment_ROM_Dec(tens);
            elsif(Anode="10") then
                D <= sevenSegment_ROM_Dec(hundreds);
            elsif (Anode="11") then
                D <= sevenSegment_ROM_Flag(7);
            end if;
        end if ;
        
        -- Anode output
        Q_Anode <= Anode;

    end process;
end Behavioral;