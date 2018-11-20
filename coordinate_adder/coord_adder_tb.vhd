library IEEE;
use IEEE.std_logic_1164.all;


entity coordinate_adder_tb is
end entity coordinate_adder_tb;


architecture structural of coordinate_adder_tb is

	component coordinate_adder is
		port (
			clk_slow		: in	std_logic;			-- Clock signal of the sample clock

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
	end component coordinate_adder;

	signal move					: std_logic_vector(3 downto 0);
	signal row_number_old, column_number_old	: std_logic_vector(4 downto 0);
	signal row_number_new, column_number_new	: std_logic_vector(4 downto 0);
	signal clk_slow					: std_logic;

begin

	CA1: coordinate_adder port map (
						clk_slow		=> clk_slow,
						move			=> move,
						row_number_old		=> row_number_old,
						column_number_old	=> column_number_old,
						row_number_new		=> row_number_new,
						column_number_new	=> column_number_new
				);

	clk_slow <=	'0' after 0 ns,
			'1' after 10 ns when clk_slow /= '1' else '0' after 10 ns;

	row_number_old <=	"00010" after 0 ns,
				"00100" after 10 ns,
				"00110" after 20 ns,
				"00101" after 30 ns,
				"10000" after 40 ns,
				"00000" after 50 ns,
				"01001" after 60 ns,
				"00111" after 70 ns,
				"01000" after 80 ns,
				"11010" after 90 ns,
				"10001" after 100 ns,
				"00011" after 110 ns;

	column_number_old <=	"00010" after 0 ns,
				"00100" after 10 ns,
				"00110" after 20 ns,
				"00101" after 30 ns,
				"10000" after 40 ns,
				"00000" after 50 ns,
				"01001" after 60 ns,
				"00111" after 70 ns,
				"01000" after 80 ns,
				"11010" after 90 ns,
				"10001" after 100 ns,
				"00011" after 110 ns;

	move <=	"0001" after 0 ns,
		"0010" after 10 ns,
		"0100" after 20 ns,
		"1000" after 30 ns,
		"0001" after 40 ns,
		"0010" after 50 ns,
		"0100" after 60 ns,
		"1000" after 70 ns,
		"0001" after 80 ns,
		"0010" after 90 ns,
		"0100" after 100 ns,
		"1000" after 110 ns;

end architecture structural;