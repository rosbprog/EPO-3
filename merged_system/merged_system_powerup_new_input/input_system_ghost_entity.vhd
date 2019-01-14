library IEEE;
use IEEE.std_logic_1164.all;

entity input_system_ghost is
	port (
		clk		: in	std_logic;
		reset		: in	std_logic;
		start		: in	std_logic;	
		
		dir_ghost	: in	std_logic_vector(2 downto 0);
		dir_out_ghost	: out	std_logic_vector(3 downto 0)	
	);
end entity input_system_ghost;
