library IEEE;
use IEEE.std_logic_1164.ALL;

entity total_system is

port(
	clk : in std_logic;
	reset: in std_logic;
	dir_pacman: in std_logic_vector(2 downto 0);
	dir_ghost1: in std_logic_vector(2 downto 0);
	dir_ghost2: in std_logic_vector(2 downto 0);
	red: out std_logic;
	green: out std_logic;
	blue: out std_logic; 
	h_sync: out std_logic;
	v_sync: out std_logic ); 

end total_system;

