library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of video_c_c is

component counter is
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
end component;

component video_control is
   port(clk           : in  std_logic;
        reset         : in  std_logic;
        sync          : in  std_logic;
        cell_type     : in  std_logic_vector(2 downto 0);
        sprite_colour : in  std_logic_vector(2 downto 0);
	pixel_array   : in  std_logic_vector(7 downto 0);
        sprite_type   : out std_logic_vector(2 downto 0);
	y_pos	      : out std_logic_vector(2 downto 0);
	colour	      : out std_logic_vector(2 downto 0);
	xcoordinates  : out std_logic_vector(4 downto 0);
	ycoordinates  : out std_logic_vector(4 downto 0);
	
	county		: in std_logic_vector(2 downto 0);
	dual_pixel_y		: in std_logic;
	current_block_horizontal : in std_logic_vector(4 downto 0);
	current_block_vertical   : in std_logic_vector(4 downto 0);

	reset_dual_pixel_y				: out std_logic;
	reset_current_block_horizontal		: out std_logic;
	reset_current_block_vertical				: out std_logic;
	reset_county				: out std_logic;

	en_county				: out std_logic;
	en_current_block_horizontal				: out std_logic;
	en_current_block_vertical				: out std_logic;
	en_dual_pixel_y				: out std_logic

	
);

end component;



signal	reset_dual_pixel_y				:  std_logic;
signal	reset_current_block_horizontal		:  std_logic;
signal	reset_current_block_vertical				:  std_logic;
signal	reset_county				:  std_logic;

signal	en_county				:  std_logic;
signal	en_current_block_horizontal				:  std_logic;
signal	en_current_block_vertical				:  std_logic;
signal	en_dual_pixel_y				:  std_logic;
	
signal	dual_pixel_y				:  std_logic;
signal	county				:  std_logic_vector(2 downto 0);
signal	current_block_horizontal 				:  std_logic_vector(4 downto 0);
signal	current_block_vertical   				:  std_logic_vector(4 downto 0);
begin

lb11: video_control port map(clk, reset, sync, cell_type, sprite_colour, pixel_array, sprite_type, y_pos, colour, xcoordinates, ycoordinates,
				  county, dual_pixel_y, current_block_horizontal, current_block_vertical, 
				  reset_dual_pixel_y, reset_current_block_horizontal, reset_current_block_vertical, reset_county,
				  en_county, en_current_block_horizontal, en_current_block_vertical, en_dual_pixel_y);
lb12: counter port map(	clk			,

	reset_dual_pixel_y			,
	reset_current_block_horizontal		,
	reset_current_block_vertical		,
	reset_county			,	

	en_county			,	
	en_current_block_horizontal,			
	en_current_block_vertical			,
	en_dual_pixel_y			,	
	
	dual_pixel_y			,
	county			,	
	current_block_horizontal ,				
	current_block_vertical   				
);

end structural;

