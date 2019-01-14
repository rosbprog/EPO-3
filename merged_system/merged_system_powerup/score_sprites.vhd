library IEEE;
use IEEE.std_logic_1164.all;

entity score_sprite is
	port(  	y_pos			:in std_logic_vector (2 downto 0);
		--Upper row is 000, lower is 111
	 	score_sprite_select	:in std_logic_vector (3 downto 0);
		--0000/1100 is 0, 0001 is 1, 0010 is 2, 0011 is 3, 0100 is 4, 0101 is 5
		--0110 is 6, 0111 is 7, 1000 is 8, 1001 is 9, 1010 is S, 1011 is C,
		--1101 is R, 1110 is E, 1111 is ':'
		row_out			:out std_logic_vector (7 downto 0)
		--right to left
		);
end entity score_sprite;
