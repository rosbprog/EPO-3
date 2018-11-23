library IEEE;
use IEEE.std_logic_1164.ALL;

entity sprite is
	port(  	y_pos		:in std_logic_vector (2 downto 0); 			--Upper row is 111, lower is 000
	 	sprite_select	:in std_logic_vector (2 downto 0); --000 coin, 001 ghost_red, 010 ghost_green, 011 pacman, 100 wall, 101/110/111 becomes open i.e. black square
		color_out 	:out std_logic_vector (2 downto 0); --respectively RGB	
		row_out		:out std_logic_vector (7 downto 0)  --left to right		
		);
end entity sprite;
