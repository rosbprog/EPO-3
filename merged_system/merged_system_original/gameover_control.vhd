library IEEE;
use IEEE.std_logic_1164.ALL;

entity gameover_control is
 port( 	clk       				: in std_logic;
        reset     					: in std_logic;
        score					: in std_logic_vector(11 downto 0);
        gameover_sync_vga          					: in std_logic;
	game_over_sig				: in std_logic;

        start_go_sel					: in std_logic;
	pixel_array				: in std_logic_vector(7 downto 0);

	dual_pixel_y				: in std_logic;
	county				: in std_logic_vector(2 downto 0);
	current_block_horizontal 				: in std_logic_vector(4 downto 0);

	go_colour       				: out std_logic_vector(2 downto 0);
	go_sprite_type				: out std_logic_vector(4 downto 0);
	go_y_pos				: out std_logic_vector(2 downto 0);

	reset_dual_pixel_y				: out std_logic;
	reset_current_block_horizontal		: out std_logic;
	reset_county				: out std_logic;

	en_county				: out std_logic;
	en_current_block_horizontal				: out std_logic;
	en_dual_pixel_y				: out std_logic
	);

end gameover_control;

