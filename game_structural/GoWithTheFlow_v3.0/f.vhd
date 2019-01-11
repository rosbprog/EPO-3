library IEEE;
use IEEE.std_logic_1164.all;


entity d_flip_flop is
	port (
		clk		: in	std_logic;
		reset		: in	std_logic;

		data_in		: in	std_logic_vector(4 downto 0);
		data_out	: out	std_logic_vector(4 downto 0)
	);
end entity d_flip_flop;
