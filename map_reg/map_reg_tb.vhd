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
			wall_present	: out	std_logic
		);
	end component map_register;

	signal wall_present			: std_logic;
	signal row_select, column_select	: std_logic_vector(4 downto 0);

begin

	MP1: map_register port map (
					row_select	=> row_select,
					column_select	=> column_select,
					wall_present	=> wall_present
				);

	column_select <=	"00000" after 0 ns,	-- column 0
				"00001" after 10 ns,	-- column 1
				"00010" after 20 ns,	-- column 2
				"00011" after 30 ns,	-- column 3
				"00100" after 40 ns,	-- column 4
				"00101" after 50 ns,	-- column 5
				"00110" after 60 ns,	-- column 6
				"00111" after 70 ns,	-- column 7
				"01000" after 80 ns,	-- column 8
				"01001" after 90 ns,	-- column 9
				"01010" after 100 ns,	-- column 10
				"01011" after 110 ns,	-- column 11
				"01100" after 120 ns,	-- column 12
				"01101" after 130 ns,	-- column 13
				"01110" after 140 ns,	-- column 14
				"01111" after 150 ns,	-- column 15
				"10000" after 160 ns,	-- column 16
				"10001" after 170 ns,	-- column 17
				"10010" after 180 ns,	-- column 18
				"10011" after 190 ns,	-- column 19
				"10100" after 200 ns,	-- column 20
				"10101" after 210 ns,	-- column 21
				"10110" after 220 ns,	-- column 22
				"10111" after 230 ns,	-- column 23
				"11000" after 240 ns;	-- column 24

	row_select <= std_logic_vector(to_unsigned(14, row_select'length));

end architecture structural;
