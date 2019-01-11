library IEEE;
use IEEE.std_logic_1164.all;


entity coordinate_comparator is
	port (
		row_number1	: in	std_logic_vector(4 downto 0);	-- Input bus representing the first row number
		column_number1	: in	std_logic_vector(4 downto 0);	-- Input bus representing the first column number
		
		row_number2	: in	std_logic_vector(4 downto 0);	-- Input bus representing the second row number
		column_number2	: in	std_logic_vector(4 downto 0);	-- Input bus representing the second column number

		is_equal	: out	std_logic			-- Output bit set to '1' when both the "row"-busses and
									--	the "column"-busses are equal, otherwise set to '0'
	);
end entity coordinate_comparator;
