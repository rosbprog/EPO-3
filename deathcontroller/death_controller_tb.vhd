library IEEE;
use IEEE.std_logic_1164.all;

entity deathcontroller_tb is
end entity deathcontroller_tb;

architecture structural of deathcontroller_tb is
	component deathcontroller is
		port (
			col_new_p	: in 	std_logic_vector(4 downto 0);
			row_new_p	: in	std_logic_vector(4 downto 0);
			
			col_old_g1	: in	std_logic_vector(4 downto 0);
			row_old_g1	: in 	std_logic_vector(4 downto 0);

			col_old_g2	: in	std_logic_vector(4 downto 0);
			row_old_g2	: in 	std_logic_vector(4 downto 0);

			sadness		: out 	std_logic
		);
	end component deathcontroller;

	signal 	col_new_p, row_new_p	: std_logic_vector(4 downto 0);
	signal	col_old_g1, row_old_g1  : std_logic_vector(4 downto 0); 
	signal	col_old_g2, row_old_g2  : std_logic_vector(4 downto 0);
	signal 	sadness	:std_logic;

begin
	lb1: deathcontroller port map (
		col_new_p,
		row_new_p,
		col_old_g1,
		row_old_g1,
		col_old_g2,
		row_old_g2,
		sadness		
	);

	col_new_p <= 	"00000" after 0 ns, --dead
		   	"10000" after 20 ns;--live	
	row_new_p <=	"00000" after 0 ns,
			"00010" after 10 ns;--dead
	col_old_g1<=	"00000" after 0 ns;
	row_old_g1<= 	"00000" after 0 ns;
		
	col_old_g2<= 	"00000" after 0 ns;
	row_old_g2<=	"00010" after 0 ns;	
end architecture structural;	
