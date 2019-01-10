library IEEE;
use IEEE.std_logic_1164.all;


entity pulse_generator is
	port (
		clk		: in std_logic;
		reset		: in std_logic;

		input_signal	: in std_logic;
		pulse		: out std_logic
	);
end entity pulse_generator;
