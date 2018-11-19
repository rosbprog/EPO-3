library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity row_controller_tb is
end entity row_controller_tb;


architecture behavioural_row_controller_tb of row_controller_tb is

	component row_controller is
		port (
			row_select	: in std_logic_vector(4 downto 0);
			row_cells	: out std_logic_vector(23 downto 0)
		);
	end component row_controller;

	signal row_select	: std_logic_vector(4 downto 0);
	signal row_cells	: std_logic_vector(23 downto 0);

begin	

	RC1: row_controller port map (
				row_select 	=> row_select,
				row_cells	=> row_cells
			);

	row_select <= 	"00000" after 0 ns,
			"00001" after 10 ns,
			"00010" after 20 ns,
			"00011" after 30 ns,
			"00100" after 40 ns,
			"00101" after 50 ns,
			"00110" after 60 ns,
			"00111" after 70 ns,
			"01000" after 80 ns,
			"01001" after 90 ns,
			"01010" after 100 ns,
			"01011" after 110 ns,
			"01100" after 120 ns,
			"01101" after 130 ns,
			"01110" after 140 ns,
			"01111" after 150 ns,
			"10000" after 160 ns,
			"10001" after 170 ns,
			"10010" after 180 ns,
			"10011" after 190 ns,
			"10100" after 200 ns,
			"10101" after 210 ns,
			"10110" after 220 ns,
			"10111" after 230 ns,
			"11000" after 240 ns;

end architecture behavioural_row_controller_tb;