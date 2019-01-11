library IEEE;
use IEEE.std_logic_1164.all;


entity input_system is
	port (
		clk		: in	std_logic;
		reset		: in	std_logic;

		-- data format:
		--	"0001" = move right
		--	"0010" = move up
		--	"0100" = move left
		--	"1000" = move down
		data_input	: in	std_logic_vector(4 downto 0);
		data_output	: out	std_logic_vector(3 downto 0);

		-- MSB of data_input is directly connected to the output "enter_button"
		enter_button	: out	std_logic
	);
end entity input_system;
