library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity coordinate_adder is
	port (
		row_number_old		: in	std_logic_vector(4 downto 0);	-- Input bus representing the row number of the original cell
		column_number_old	: in	std_logic_vector(4 downto 0);	-- Input bus representing the column number of the original cell
		move			: in	std_logic_vector(3 downto 0);	-- Input bus representing the movement direction to the new cell:
										--	"0001" = right;
										--	"0010" = up;
										--	"0100" = left;
										--	"1000" = down;

		row_number_new		: out	std_logic_vector(4 downto 0);	-- Output bus representing the row number of the new cell
										--	after moving from the original cell
		column_number_new	: out	std_logic_vector(4 downto 0)	-- Output bus representing the column number of the new cell
										--	after moving from the original cell
	);
end entity coordinate_adder;
