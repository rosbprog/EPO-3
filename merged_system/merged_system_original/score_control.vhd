library IEEE;
use IEEE.std_logic_1164.ALL;
entity score_control is
  port(	clk           					: in  std_logic;
       	reset         					: in  std_logic;
       	score_sync          					: in  std_logic;
       	score_a     					: in  std_logic_vector(3 downto 0);
	score_b     					: in  std_logic_vector(3 downto 0);
	score_c     					: in  std_logic_vector(3 downto 0);
	pixel_array   					: in  std_logic_vector(7 downto 0);

	dual_pixel_y					: in std_logic;
	county					: in std_logic_vector(2 downto 0);
	current_block_horizontal 					: in std_logic_vector(4 downto 0);
	user_reset_score									: in std_logic;

	colour					: out std_logic_vector(2 downto 0);
        score_sprite_type   						: out std_logic_vector(3 downto 0);
	score_y_pos	      				: out std_logic_vector(2 downto 0);
	
	reset_dual_pixel_y					: out std_logic;
	reset_current_block_horizontal					: out std_logic;
	reset_county					: out std_logic;

	en_county					: out std_logic;
	en_current_block_horizontal					: out std_logic;
	en_dual_pixel_y					: out std_logic
	
	);
	
end score_control;

