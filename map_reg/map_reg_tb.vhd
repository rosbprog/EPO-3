library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity map_register_tb is
end entity map_register_tb;


architecture structural of map_register_tb is

	component map_register is
		port (
			row_select	: in	std_logic_vector(4 downto 0);
			column_select	: in	std_logic_vector(4 downto 0);
			cell_value	: out	std_logic
		);
	end component map_register;

	signal cell_value			: std_logic;
	signal row_select, column_select	: std_logic_vector(4 downto 0);

begin

	MP1: map_register port map (
					row_select	=> row_select,
					column_select	=> column_select,
					cell_value	=> cell_value
				);

	column_select <=	"00000" after 5 ns,
				"00001" after 25 ns,
				"00010" after 45 ns,
				"00011" after 65 ns,
				"00100" after 85 ns,
				"00101" after 105 ns,
				"00110" after 125 ns,
				"00111" after 145 ns,
				"01000" after 165 ns,
				"01001" after 185 ns,
				"01010" after 205 ns,
				"01011" after 225 ns,
				"01100" after 245 ns,
				"01101" after 265 ns,
				"01110" after 285 ns,
				"01111" after 305 ns,
				"10000" after 325 ns,
				"10001" after 345 ns,
				"10010" after 365 ns,
				"10011" after 385 ns,
				"10100" after 405 ns,
				"10101" after 425 ns,
				"10110" after 445 ns,
				"10111" after 465 ns,
				"11000" after 485 ns;

	row_select <= std_logic_vector(to_unsigned(13, row_select'length));

end architecture structural;