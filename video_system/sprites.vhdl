library IEEE;
use IEEE.std_logic_1164.all;

entity sprite is
	port(
	y_pos		:in std_logic_vector (2 downto 0);
	--Upper row is 000, lower is 111
	sprite_select	:in std_logic_vector (5 downto 0);
	--leftmost bit indicates whether Pac-Mans mouth is open (1) or closed [semi-open (0)]
	--next 2 bits indicate the orientation of Pac-Man:
	--00 is right, 01 is down, 10 is left, 11 is up
	--last 3 bits indicate the game sprite which is to be selected
	--001 pacman, 010 ghost_red, 011 ghost_green, 101 coin, 110 wall
	--000/100/111 becomes open i.e. black square

	--selection of a sprite is done first;
	--if this is not Pac-Man, then the mouth and orientation information remain unused
	color_out	:out std_logic_vector (2 downto 0);
	--respectively RGB
	row_out		:out std_logic_vector (7 downto 0)
	--left to right
	);
end entity sprite;
