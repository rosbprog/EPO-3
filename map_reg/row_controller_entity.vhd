library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity row_controller is
	port (
		row_select	: in	std_logic_vector(4 downto 0);	-- Input bus for selecting row to put on the output bus
		row_cells	: out	std_logic_vector(23 downto 0)	-- Output bus representing all cells in specified row
	);
end entity row_controller;