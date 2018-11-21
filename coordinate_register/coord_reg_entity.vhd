library IEEE;
use IEEE.std_logic_1164.all;


entity coordinate_register is
	port (
		clk			: in	std_logic;			-- System clock (12.5 MHz assumed)
		reset			: in	std_logic;			-- System reset

		row_number_reset	: in	std_logic_vector(4 downto 0);	-- Input bus representing the reset (default) row number
		column_number_reset	: in	std_logic_vector(4 downto 0);	-- Input bus representing the reset (default) column number

		row_number_in		: in	std_logic_vector(4 downto 0);	-- Input bus representing the new row number
		column_number_in	: in	std_logic_vector(4 downto 0);	-- Input bus representing the new column number

		row_number_out		: out	std_logic_vector(4 downto 0);	-- Output bus representing the currently stored row number
		column_number_out	: out	std_logic_vector(4 downto 0)	-- Output bus representing the currently stored column number
	);
end entity coordinate_register;