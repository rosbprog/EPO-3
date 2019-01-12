library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity score_count is
port(
	clk 	: in std_logic;
	reset	: in std_logic;
	plus	: in std_logic;
	a,b,c	: out std_logic_vector(3 downto 0)
);
end entity score_count; 
