library IEEE;
use IEEE.std_logic_1164.all;

entity deathcontroller is
	port (
		col_new_p	: in 	std_logic_vector(4 downto 0);
		row_new_p	: in	std_logic_vector(4 downto 0);
			
		col_old_g1	: in	std_logic_vector(4 downto 0);
		row_old_g1	: in 	std_logic_vector(4 downto 0);

		col_old_g2	: in	std_logic_vector(4 downto 0);
		row_old_g2	: in 	std_logic_vector(4 downto 0);

		sadness		: out 	std_logic
	);
end entity deathcontroller;
