library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity PC_5 is
  Port (Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Addr_Jump : in STD_LOGIC_VECTOR (4 downto 0);
        Jump_Flag : in STD_LOGIC; 
        M : out STD_LOGIC_VECTOR (4 downto 0)
   );
  end PC_5;

architecture Behavioral of PC_5 is
  signal Q : STD_LOGIC_VECTOR (4 downto 0);
begin
  process(Clk) begin
    if(rising_edge(Clk)) then
      if Res='1' then
        Q <= "00000";
      elsif Jump_Flag='1' then
        Q <= Addr_Jump;
      else
        Q <= STD_LOGIC_VECTOR(unsigned(Q)+"1");
      end if;      
    end if;
    M <= Q;
  end process;
end Behavioral;
