library IEEE;
use IEEE.std_logic_1164.ALL;

entity score_system is
 port( 	clk       				: in std_logic;
        reset     					: in std_logic;
        score_plus					: in std_logic;
        score_sync_vga          					: in  std_logic;

	dual_pixel_y				: in std_logic;
	county				: in std_logic_vector(2 downto 0);
	current_block_horizontal 				: in std_logic_vector(4 downto 0);

	rgb_score       				: out std_logic_vector(2 downto 0);

	reset_dual_pixel_y				: out std_logic;
	reset_current_block_horizontal		: out std_logic;
	reset_county				: out std_logic;

	en_county				: out std_logic;
	en_current_block_horizontal				: out std_logic;
	en_dual_pixel_y				: out std_logic
	);

end score_system;

