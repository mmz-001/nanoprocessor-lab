library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           zero : out STD_LOGIC;
           overflow : out STD_LOGIC;
           led:out std_logic_vector (3 downto 0));
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is



component REG_4_BANK_8 is
  Port (Res : in STD_LOGIC;
        R_En : in STD_LOGIC_VECTOR (2 downto 0);
        Clk : in STD_LOGIC;
        R_In : in STD_LOGIC_VECTOR (3 downto 0);
        R_0 : out STD_LOGIC_VECTOR (3 downto 0);
        R_1 : out STD_LOGIC_VECTOR (3 downto 0);
        R_2 : out STD_LOGIC_VECTOR (3 downto 0);
        R_3 : out STD_LOGIC_VECTOR (3 downto 0);
        R_4 : out STD_LOGIC_VECTOR (3 downto 0);
        R_5 : out STD_LOGIC_VECTOR (3 downto 0);
        R_6 : out STD_LOGIC_VECTOR (3 downto 0);
        R_7 : out STD_LOGIC_VECTOR (3 downto 0)
  );
end component;

component REG_4 is
  Port (D : in STD_LOGIC_VECTOR (3 downto 0);
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        En : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RCA_3 is
    Port ( PC_in : in STD_LOGIC_VECTOR (2 downto 0);
           PC_out : out STD_LOGIC_VECTOR (2 downto 0);
           c_out : out std_logic);
           
end component;

component PC_3 is
  Port (Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (2 downto 0);
        M : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component INS_DECODER is
  Port (
    I : in STD_LOGIC_VECTOR (11 downto 0);
    R : in STD_LOGIC_VECTOR (3 downto 0);
    R_En, RA_Sel, RB_Sel, JMP_Add : out STD_LOGIC_VECTOR (2 downto 0);
    Load_Sel, Add_Sub_Sel, JMP_Flag : out STD_LOGIC;
    Im_Val : out STD_LOGIC_VECTOR (3 downto 0)
  );
end component;

component MUX_2_way_3_bit is
    Port ( adder_in : in STD_LOGIC_VECTOR (2 downto 0);
           jump_in : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_flag : in STD_LOGIC;
           out_bus : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2_way_4_bit is
    Port ( in_01 : in STD_LOGIC_VECTOR (3 downto 0);
           in_02 : in STD_LOGIC_VECTOR (3 downto 0);
           select_bit : in STD_LOGIC;
           out_bus : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_8_way_4_bit is
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           sel_bus : in STD_LOGIC_VECTOR (2 downto 0);
           out_bus : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal r0,r1,r2,r3,r4,r5,r6,r7 :    STD_LOGIC_VECTOR (3 downto 0);
signal mux_4_a,mux_4_b :    STD_LOGIC_VECTOR (3 downto 0);
signal: 

begin

mux_8_to_4_1:mux_8_to_4 port map(
    r0=>r0,
    r1=>r1,
    r2=>r2,
    r3=>r3,
    r4=>r4,
    r5=>r5,
    r6=>r6,
    r7=>r7,
    o=>mux_4_a,
    s=>reg_mux_a);
mux_8_to_4_2:mux_8_to_4 port map(
    r0=>r0,
    r1=>r1,
    r2=>r2,
    r3=>r3,
    r4=>r4,
    r5=>r5,
    r6=>r6,
    r7=>r7,
    o=>mux_4_b,
    s=>reg_mux_b);
rca_1:rca_4 port map(
    a=>mux_4_a,
    b=>mux_4_b,
    s=>mux_out,
    c_in=>addsub,
    c_out=>overflow);
mux: mux_2_to_4 port map(
    r0=>mux_out,
    r1=>imvalue,
    o=>data_mux,
    s=>load_select);
mux_2_to_3_1: mux_2_to_3 port map(
    r0=>adder_out,
    r1=>add,
    s=>jmp_flag,
    o=>muxcounter);

adder_3: rca_3 port map(
    a=>prog_counter,
    s=>adder_out);

counter: p_counter port map(
    d=>muxcounterout,
    clk=>clk,
    res=>reset,
    q=>prog_counter);
led <=  r7;



end Behavioral;