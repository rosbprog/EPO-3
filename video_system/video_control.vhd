library IEEE;
use IEEE.std_logic_1164.ALL;

entity video_control is
   port(clk           					: in  std_logic;
        reset         					: in  std_logic;
        sync          					: in  std_logic;
        cell_type     					: in  std_logic_vector(2 downto 0);
        sprite_colour 					: in  std_logic_vector(2 downto 0);
	pixel_array   				: in  std_logic_vector(7 downto 0);
        sprite_type   					: out std_logic_vector(2 downto 0);
	y_pos	      			: out std_logic_vector(2 downto 0);
	colour	      			: out std_logic_vector(2 downto 0);
	xcoordinates  				: out std_logic_vector(4 downto 0);
	ycoordinates  				: out std_logic_vector(4 downto 0);
	
	county				: in std_logic_vector(2 downto 0);
	dual_pixel_y				: in std_logic;
	current_block_horizontal 				: in std_logic_vector(4 downto 0);
	current_block_vertical   				: in std_logic_vector(4 downto 0);

	reset_dual_pixel_y				: out std_logic;
	reset_current_block_horizontal		: out std_logic;
	reset_current_block_vertical				: out std_logic;
	reset_county				: out std_logic;

	en_county				: out std_logic;
	en_current_block_horizontal				: out std_logic;
	en_current_block_vertical				: out std_logic;
	en_dual_pixel_y				: out std_logic;
	user_reset									: in std_logic
       );
end video_control;

