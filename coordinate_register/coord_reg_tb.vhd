library IEEE;
use IEEE.std_logic_1164.all;


entity coordinate_register_tb is
end entity coordinate_register_tb;


architecture structural of coordinate_register_tb is

	component coordinate_register is
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
	end component coordinate_register;

	signal clk, reset				: std_logic;
	signal row_number_reset, column_number_reset	: std_logic_vector(4 downto 0);
	signal row_number_in, column_number_in		: std_logic_vector(4 downto 0);
	signal row_number_out, column_number_out	: std_logic_vector(4 downto 0);

begin

	CR1: coordinate_register port map (
						clk			=> clk,
						reset			=> reset,
						row_number_reset	=> row_number_reset,
						column_number_reset	=> column_number_reset,
						row_number_in		=> row_number_in,
						column_number_in	=> column_number_in,
						row_number_out		=> row_number_out,
						column_number_out	=> column_number_out
					);

	clk <= 	'0' after 0 ns,
		'1' after 5 ns when clk /= '1' else '0' after 5 ns;

	reset <=	'1' after 0 ns, '0' after 30 ns,
			'1' after 130 ns, '0' after 150 ns;

	row_number_reset <=	"10000" after 0 ns;
	column_number_reset <=	"01011" after 0 ns;

	row_number_in <=	"00000" after 0 ns,
				"00100" after 12 ns,
				"10010" after 22 ns,
				"01100" after 32 ns,
				"11011" after 42 ns,
				"00010" after 52 ns,
				"01100" after 62 ns,
				"10010" after 72 ns,
				"01001" after 82 ns,
				"00011" after 92 ns,
				"00111" after 102 ns,
				"11111" after 112 ns,
				"01110" after 122 ns,
				"10110" after 132 ns,
				"00010" after 142 ns;

	column_number_in <=	"01000" after 0 ns,
				"00111" after 12 ns,
				"10100" after 22 ns,
				"01001" after 32 ns,
				"11110" after 42 ns,
				"00100" after 52 ns,
				"10011" after 62 ns,
				"10100" after 72 ns,
				"11010" after 82 ns,
				"00111" after 92 ns,
				"01001" after 102 ns,
				"11000" after 112 ns,
				"01111" after 122 ns,
				"11111" after 132 ns,
				"10101" after 142 ns;

end architecture structural;