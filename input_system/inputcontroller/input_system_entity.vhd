library IEEE;
use IEEE.std_logic_1164.all;

entity input_system is
	port (
		clk		: in	std_logic;
		reset		: in	std_logic;

		dir_pacman	: in	std_logic_vector(2 downto 0);
		dir_ghost1	: in	std_logic_vector(2 downto 0);
		dir_ghost2	: in	std_logic_vector(2 downto 0);

		dir_out_p1	: out	std_logic_vector(3 downto 0);
		dir_out_p2	: out	std_logic_vector(3 downto 0);
		dir_out_p3	: out	std_logic_vector(3 downto 0);
		start		: out	std_logic
	);
end entity input_system;
