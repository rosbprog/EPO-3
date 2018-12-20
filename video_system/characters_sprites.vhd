library IEEE;
use IEEE.std_logic_1164.all;

entity character_sprite is
	port(  	y_pos			:in std_logic_vector (2 downto 0);
		--Upper row is 000, lower is 111
	 	char_sprite_select	:in std_logic_vector (4 downto 0);
		--00000/01100 is 0, 00001 is 1, 00010 is 2, 00011 is 3, 00100 is 4, 00101 is 5
		--00110 is 6, 00111 is 7, 01000 is 8, 01001 is 9, 01010 is S, 01011 is C,
		--01101 is R, 01110 is E, 01111 is ':', 10000 is G, 10001 is A,
    --10010 is M, 10011 is T, 10100 is V, 10101 is empty (ie black) square,
    --10110 is P, 10111 is N, 11000 is '-'

		row_out			:out std_logic_vector (7 downto 0)
		--right to left
		);
end entity character_sprite;
