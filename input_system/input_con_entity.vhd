library IEEE;
use IEEE.std_logic_1164.all;

entity input_controller is
	port (
		clk			: in	std_logic;
		reset			: in	std_logic;

		move_in			: in	std_logic_vector(3 downto 0);
		move_out		: out	std_logic_vector(3 downto 0)
	);
end entity input_controller;