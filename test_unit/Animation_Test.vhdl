library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Animation_Test is
    Port ( Clk : in STD_LOGIC;
           Seven_Seg_Out_L : out STD_LOGIC_VECTOR (7 downto 0) := "11111111";
           Anode_Out_L : out STD_LOGIC_VECTOR (3 downto 0) := "1111");
end Animation_Test;

architecture Behavioral of Animation_Test is
  component Frame_LUT
  Port (D : in STD_LOGIC_VECTOR (7 downto 0);
        Seg_Out_0 : out STD_LOGIC_VECTOR (7 downto 0);
        Seg_Out_1 : out STD_LOGIC_VECTOR (7 downto 0);
        Seg_Out_2 : out STD_LOGIC_VECTOR (7 downto 0);
        Seg_Out_3 : out STD_LOGIC_VECTOR (7 downto 0));
  end component;

	component Slow_Clk
		Port ( Clk_In : in STD_LOGIC;
		Clk_Out : out STD_LOGIC);
	end component;


  signal Frame_Count : integer := 0;
  signal Seg_Count : integer := 0;
	signal Clk_Count : integer := 0;
  signal D : STD_LOGIC_VECTOR (7 downto 0);
	signal Seg_Out_0 : STD_LOGIC_VECTOR (7 downto 0);
	signal Seg_Out_1 : STD_LOGIC_VECTOR (7 downto 0);
	signal Seg_Out_2 : STD_LOGIC_VECTOR (7 downto 0);
	signal Seg_Out_3 : STD_LOGIC_VECTOR (7 downto 0);
	signal Clk_Slow : STD_LOGIC;
begin

  Frame_LUT_0 : Frame_LUT
  Port Map (
    D => D,
    Seg_Out_0 => Seg_Out_0,
    Seg_Out_1 => Seg_Out_1,
    Seg_Out_2 => Seg_Out_2,
    Seg_Out_3 => Seg_Out_3
  );

	Slow_Clk_0 : Slow_Clk
	Port Map (
		Clk_in => Clk,
		Clk_Out => Clk_Slow
	);

  
  process (Clk_Slow)
  begin
      if (rising_edge(Clk_Slow)) then
          if (Seg_Count = 0) then
						Seven_Seg_Out_L <= Seg_Out_0;	
						Anode_Out_L <= "1110";
					elsif (Seg_Count = 1) then
						Seven_Seg_Out_L <= Seg_Out_1;
						Anode_Out_L <= "1101";
					elsif (Seg_Count = 2) then
						Seven_Seg_Out_L <= Seg_Out_2;
						Anode_Out_L <= "1011";
					elsif (Seg_Count = 3) then
						Seven_Seg_Out_L <= Seg_Out_3;
						Anode_Out_L <= "0111";			
					end if;

					Seg_Count <= (Seg_Count + 1) MOD 4;
					
					if (Seg_Count = 3) then
						Clk_Count <= (Clk_Count + 1) MOD 41;      	
					end if;
					if (Clk_Count = 40) then
						Frame_Count <= (Frame_Count + 1) MOD 256;
						Clk_Count <= (Clk_Count + 1) MOD 41;      	
					end if;
          D <= STD_LOGIC_VECTOR(to_unsigned(Frame_Count, D'length));
      end if;      
  end process;

end Behavioral;