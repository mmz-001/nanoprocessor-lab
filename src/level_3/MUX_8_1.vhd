library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_1 is
    Port ( Sel : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC);
end MUX_8_1;

architecture Behavioral of MUX_8_1 is

component Decoder_3_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal D_And_Dec_Out : Std_logic_vector(7 downto 0); -- to get output from the AND gates to the final OR gate
signal Dec_Out : std_logic_vector(7 downto 0); -- to take output of 3 to 8 decoder to the and gates

begin
    Decoder_3_8_0 : Decoder_3_8
    port map(
        I=>Sel,
        En=> En,
        Q=>Dec_Out);
    
    D_And_Dec_Out(0)<=D(0) and Dec_Out(0);
    D_And_Dec_Out(1)<=D(1) and Dec_Out(1);
    D_And_Dec_Out(2)<=D(2) and Dec_Out(2);
    D_And_Dec_Out(3)<=D(3) and Dec_Out(3);
    D_And_Dec_Out(4)<=D(4) and Dec_Out(4);
    D_And_Dec_Out(5)<=D(5) and Dec_Out(5);
    D_And_Dec_Out(6)<=D(6) and Dec_Out(6);
    D_And_Dec_Out(7)<=D(7) and Dec_Out(7);

    Q<= D_And_Dec_Out(0) 
        or D_And_Dec_Out(1) 
        or D_And_Dec_Out(2) 
        or D_And_Dec_Out(3) 
        or D_And_Dec_Out(4) 
        or D_And_Dec_Out(5) 
        or D_And_Dec_Out(6) 
        or D_And_Dec_Out(7);
    

end Behavioral;
