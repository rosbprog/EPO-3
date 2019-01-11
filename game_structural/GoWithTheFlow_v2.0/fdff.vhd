library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity map_register is
	port (
		row_select	: in 	std_logic_vector(4 downto 0);	-- Input bus for selecting a row
		column_select	: in 	std_logic_vector(4 downto 0);	-- Input bus for selecting a column
		wall_present	: out	std_logic			-- Output bit representing the state of the selected cell:
									-- 	0 = 'empty';	1 = 'wall';
	);
end entity map_register;
