
library IEEE;
use IEEE.std_logic_1164.all;


entity coordinate_multiplexer is
	port (
		sel			: in std_logic;

		row_number_in1		: in std_logic_vector(4 downto 0);
		column_number_in1	: in std_logic_vector(4 downto 0);

		row_number_in2		: in std_logic_vector(4 downto 0);
		column_number_in2	: in std_logic_vector(4 downto 0);

		row_number_out		: out std_logic_vector(4 downto 0);
		column_number_out	: out std_logic_vector(4 downto 0)
	);
end entity coordinate_multiplexer;
