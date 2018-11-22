library IEEE;
use IEEE.std_logic_1164.all;


entity coordinate_multiplexer_tb is
end entity coordinate_multiplexer_tb;


architecture structural of coordinate_multiplexer_tb is

	component coordinate_multiplexer is
		port (
			sel			: in std_logic;

			row_number_in1		: in std_logic_vector(4 downto 0);
			column_number_in1	: in std_logic_vector(4 downto 0);

			row_number_in2		: in std_logic_vector(4 downto 0);
			column_number_in2	: in std_logic_vector(4 downto 0);

			row_number_out		: out std_logic_vector(4 downto 0);
			column_number_out	: out std_logic_vector(4 downto 0)
		);
	end component coordinate_multiplexer;

	signal sel					: std_logic;
	signal row_number_in1, column_number_in1	: std_logic_vector(4 downto 0);
	signal row_number_in2, column_number_in2	: std_logic_vector(4 downto 0);
	signal row_number_out, column_number_out	: std_logic_vector(4 downto 0);

begin

	CM1: coordinate_multiplexer port map (
						sel			=> sel,
						row_number_in1		=> row_number_in1,
						column_number_in1	=> column_number_in1,
						row_number_in2		=> row_number_in2,
						column_number_in2	=> column_number_in2,
						row_number_out		=> row_number_out,
						column_number_out	=> column_number_out
					);

	sel <=	'0' after 0 ns,
		'1' after 50 ns,
		'0' after 70 ns,
		'1' after 100 ns,
		'0' after 150 ns;

	row_number_in1		<= "00001";
	column_number_in1	<= "00010";

	row_number_in2		<= "10000";
	column_number_in2	<= "01000";

end architecture structural;