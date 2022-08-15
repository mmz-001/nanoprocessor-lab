library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity PC_3 is
  Port (Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Addr_Jump : in STD_LOGIC_VECTOR (4 downto 0);
        Q_last : in STD_LOGIC_VECTOR(4 downto 0);
        Jump_Flag : in STD_LOGIC; 
        Q : out STD_LOGIC_VECTOR (4 downto 0)
   );
  end PC_3;

architecture Behavioral of PC_3 is

begin
  process(Clk) begin
    if(rising_edge(Clk)) then
      if Res='1' then
        Q <= "00000";
      elsif Jump_Flag='1' then
        Q <= Addr_Jump;
      else
        Q <= STD_LOGIC_VECTOR(unsigned(Q_last)+"1");
      end if;
    end if;
  end process;
end Behavioral;
