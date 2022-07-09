library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4 is
		port ( 
				A0, A1, A2, A3, B0, B1, B2, B3, C_in : in std_logic;
				S0, S1, S2, S3, C_out : out std_logic
		);
		end RCA_4;

architecture Behavioral of RCA_4 is

		component FA
				port (
						A, B, C_in: in std_logic;
						S, C_out: out std_logic
				);
		end component;

SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C : std_logic;

begin
		FA_0 : FA
				port map (
						A => A0,
						B => B0,
						C_in => C_in,
						S => S0,
						C_Out => FA0_C
				);

		FA_1 : FA
				port map (
						A => A1,
						B => B1,
						C_in => FA0_C,
						S => S1,
						C_Out => FA1_C
				);

		FA_2 : FA
				port map (
						A => A2,
						B => B2,
						C_in => FA1_C,
						S => S2,
						C_Out => FA2_C
				);

		FA_3 : FA
				port map (
						A => A3,
						B => B3,
						C_in => FA2_C,
						S => S3,
						C_Out => C_out
				);

end Behavioral;
