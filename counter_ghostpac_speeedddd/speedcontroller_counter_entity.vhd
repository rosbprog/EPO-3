library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
	port(	vc_done		: in	std_logic;
		c_rst		: in 	std_logic; 
		count_out 	: out 	std_logic_vector(6 downto 0));
end entity counter;
