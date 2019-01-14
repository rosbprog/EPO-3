library IEEE;
use IEEE.std_logic_1164.all;


entity input_buffer is
	port (
		clk		: in	std_logic;
		reset		: in	std_logic;

		data_in		: in	std_logic_vector(3 downto 0);
		data_out	: out	std_logic_vector(3 downto 0)
	);
end entity input_buffer;