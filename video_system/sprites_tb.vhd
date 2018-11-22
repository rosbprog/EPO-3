library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sprite_tb is 
end entity sprite_tb; 

architecture structural of sprite_tb is
signal y_pos, sprite_select, color_out: std_logic_vector (2 downto 0);
signal row_out: std_logic_vector (7 downto 0);

component sprite is
	port(	y_pos		:in std_logic_vector (2 downto 0); 
		--Upper row is 000, lower is 111
	 	sprite_select	:in std_logic_vector (2 downto 0); 
		--000 coin, 001 ghost_red, 010 ghost_green, 011 pacman, 100 wall
		--101/110/111 becomes open i.e. black square
		color_out 	:out std_logic_vector (2 downto 0); --respectively RGB	
		row_out		:out std_logic_vector (7 downto 0)  --left to right		
		);
end component sprite;

begin

sprite_select <= "000" after 0 ns, "001" after 100 ns, "010" after 200 ns, "011" after 300 ns, "100" after 400 ns, "101" after 500 ns, "110" after 600 ns, "111" after 700 ns;

y_pos <= "000" after 0 ns, "001" after 10 ns, "010" after 20 ns, "011" after 30 ns, "100" after 40 ns, "101" after 50 ns, "110" after 60 ns, "111" after 70 ns,
"000" after 100 ns, "001" after 110 ns, "010" after 120 ns, "011" after 130 ns, "100" after 140 ns, "101" after 150 ns, "110" after 160 ns, "111" after 170 ns,
"000" after 200 ns, "001" after 210 ns, "010" after 220 ns, "011" after 230 ns, "100" after 240 ns, "101" after 250 ns, "110" after 260 ns, "111" after 270 ns,
"000" after 300 ns, "001" after 310 ns, "010" after 320 ns, "011" after 330 ns, "100" after 340 ns, "101" after 350 ns, "110" after 360 ns, "111" after 370 ns,
"000" after 400 ns, "001" after 410 ns, "010" after 420 ns, "011" after 430 ns, "100" after 440 ns, "101" after 450 ns, "110" after 460 ns, "111" after 470 ns,
"000" after 500 ns, "001" after 510 ns, "010" after 520 ns, "011" after 530 ns, "100" after 540 ns, "101" after 550 ns, "110" after 560 ns, "111" after 570 ns,
"000" after 600 ns, "001" after 610 ns, "010" after 620 ns, "011" after 630 ns, "100" after 640 ns, "101" after 650 ns, "110" after 660 ns, "111" after 670 ns,
"000" after 700 ns, "001" after 710 ns, "010" after 720 ns, "011" after 730 ns, "100" after 740 ns, "101" after 750 ns, "110" after 760 ns, "111" after 770 ns;


test: sprite port map (y_pos => y_pos, sprite_select => sprite_select, color_out => color_out, row_out => row_out);

end architecture structural;
