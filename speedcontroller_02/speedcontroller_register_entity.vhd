library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity register_7bit is
	port(	clk		: in	std_logic;
		count_in	: in	std_logic_vector(6 downto 0);
		c_rst		: in 	std_logic; 
		count_out 	: out 	std_logic_vector(6 downto 0));
end entity register_7bit;
