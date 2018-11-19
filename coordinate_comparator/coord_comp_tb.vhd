library IEEE;
use IEEE.std_logic_1164.all;


entity coordinate_comparator_tb is
end entity coordinate_comparator_tb;


architecture structural of coordinate_comparator_tb is

	component coordinate_comparator is
		port (
			row_number1	: in	std_logic_vector(4 downto 0);
			column_number1	: in	std_logic_vector(4 downto 0);
			
			row_number2	: in	std_logic_vector(4 downto 0);
			column_number2	: in	std_logic_vector(4 downto 0);
	
			is_equal	: out	std_logic
		);
	end component coordinate_comparator;

	signal row_number1, column_number1, row_number2, column_number2		: std_logic_vector(4 downto 0);
	signal is_equal								: std_logic;

begin

	CC1: coordinate_comparator port map (
						row_number1	=> row_number1,
						column_number1	=> column_number1,
						row_number2	=> row_number2,
						column_number2	=> column_number2,
						is_equal	=> is_equal
					);

	row_number1 <=	"00000" after 0 ns,
			"00100" after 10 ns,
			"00101" after 20 ns,
			"10000" after 30 ns,
			"00110" after 40 ns,
			"01110" after 50 ns,
			"00011" after 60 ns,
			"00001" after 70 ns,
			"11111" after 80 ns;

	row_number2 <=	"00000" after 0 ns,
			"00100" after 12 ns,
			"00101" after 22 ns,
			"10000" after 32 ns,
			"00110" after 42 ns,
			"01000" after 52 ns,	-- changed
			"00011" after 62 ns,
			"00001" after 72 ns,
			"10111" after 82 ns;	-- changed

	column_number1 <=	"00110" after 0 ns,
				"01011" after 14 ns,
				"01001" after 24 ns,
				"10101" after 34 ns,
				"00111" after 44 ns,
				"10010" after 54 ns,
				"01100" after 64 ns,
				"00011" after 74 ns,
				"11100" after 84 ns;

	column_number2 <=	"00110" after 0 ns,
				"01011" after 16 ns,
				"01101" after 26 ns,	-- changed
				"10101" after 36 ns,
				"00111" after 46 ns,
				"10010" after 56 ns,
				"01100" after 66 ns,
				"00100" after 76 ns,	-- changed
				"11100" after 86 ns;

end architecture structural;