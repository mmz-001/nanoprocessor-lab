library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_8_8 is
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

end Reg_8_8;

architecture Behavioral of Reg_8_8 is
    component Decoder_3_To_8
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
            Q0 : out STD_LOGIC;
            Q1 : out STD_LOGIC;
            Q2 : out STD_LOGIC;
            Q3 : out STD_LOGIC;
            Q4 : out STD_LOGIC;
            Q5 : out STD_LOGIC;
            Q6 : out STD_LOGIC;
            Q7 : out STD_LOGIC);
    end component;

    component Reg_8
        Port ( Clk : in STD_LOGIC;
            Res : in STD_LOGIC;
            D : in STD_LOGIC_VECTOR (7 downto 0);
            En : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (7 downto 0));
    end component;


signal sig_Q0,sig_Q1,sig_Q2,sig_Q3,sig_Q4,sig_Q5,sig_Q6,sig_Q7 : STD_LOGIC;

begin
    Decoder_3_To_8_0 : Decoder_3_To_8
        port map (
            A => R_En,
            Q0 => sig_Q0,
            Q1 => sig_Q1,
            Q2 => sig_Q2,
            Q3 => sig_Q3,
            Q4 => sig_Q4,
            Q5 => sig_Q5,
            Q6 => sig_Q6,
            Q7 => sig_Q7
        );
    
     Reg_8_0 : Reg_8
        port map(
            Clk => Clk,
            Res => Res,
            D => R_In,
            En => sig_Q0,
            Q => R_0
        );
    
     Reg_8_1 : Reg_8
        port map(
            Clk => Clk,
            Res => Res,
            D => R_In,
            En => sig_Q1,
            Q => R_1
        );
    
     Reg_8_2 : Reg_8
        port map(
            Clk => Clk,
            Res => Res,
            D => R_In,
            En => sig_Q2,
            Q => R_2
        );
    
     Reg_8_3 : Reg_8
        port map(
            Clk => Clk,
            Res => Res,
            D => R_In,
            En => sig_Q3,
            Q => R_3
        );
    
     Reg_8_4 : Reg_8
        port map(
            Clk => Clk,
            Res => Res,
            D => R_In,
            En => sig_Q4,
            Q => R_4
        );
    
     Reg_8_5 : Reg_8
        port map(
            Clk => Clk,
            Res => Res,
            D => R_In,
            En => sig_Q5,
            Q => R_5
        );
    
     Reg_8_6 : Reg_8
        port map(
            Clk => Clk,
            Res => Res,
            D => R_In,
            En => sig_Q6,
            Q => R_6
        );
    
     Reg_8_7 : Reg_8
        port map(
            Clk => Clk,
            Res => Res,
            D => R_In,
            En => sig_Q7,
            Q => R_7
        );
    
    
end Behavioral;