library IEEE;
use IEEE.std_logic_1164.all;

entity sprite is
	port(  	y_pos		:in std_logic_vector (2 downto 0);
		--Upper row is 000, lower is 111
	 	sprite_select	:in std_logic_vector (2 downto 0);
		--001 pacman, 010 ghost_red, 011 ghost_green, 101 coin, 110 wall
		--000/100/111 becomes open i.e. black square
		color_out 	:out std_logic_vector (2 downto 0); --respectively RGB
		row_out		:out std_logic_vector (7 downto 0)  --left to right
		);
end entity sprite;
