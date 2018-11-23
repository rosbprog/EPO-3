library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter is
	port(
	clk				: in std_logic;

	reset_dual_pixel_y				: in std_logic;
	reset_current_block_horizontal		: in std_logic;
	reset_current_block_vertical				: in std_logic;
	reset_county				: in std_logic;

	en_county				: in std_logic;
	en_current_block_horizontal				: in std_logic;
	en_current_block_vertical				: in std_logic;
	en_dual_pixel_y				: in std_logic;
	
	dual_pixel_y				: out std_logic;
	county				: out std_logic_vector(2 downto 0);
	current_block_horizontal 				: out std_logic_vector(4 downto 0);
	current_block_vertical   				: out std_logic_vector(4 downto 0));
end counter;

