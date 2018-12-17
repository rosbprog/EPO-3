library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

architecture structural of video_system is
   component score_system
    port( 		clk       				: in std_logic;
           		reset     				: in std_logic;
          		score_plus				: in std_logic;
           		score_sync_vga          				: in std_logic;
   
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
   
   end component;



component vga_controll is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        rgb          : in  std_logic_vector(2 downto 0);
        pixel_sync		 : out std_logic;
	score_pixel_sync	 : out std_logic;
        red          : out std_logic;
        green        : out std_logic;
        blue         : out std_logic;
        h_sync       : out std_logic;
        v_sync       : out std_logic;
	calc_start	  : out std_logic);
end component vga_controll;

component video_control is
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
	en_dual_pixel_y				: out std_logic
       );
end component video_control;

component sprite is
	port(  	y_pos		: in std_logic_vector (2 downto 0); --Upper row is 111, lower is 000
	 	sprite_select		: in std_logic_vector (2 downto 0); --000 coin, 001 ghost_red, 010 ghost_green, 011 pacman, 100 wall --101/110/111 becomes open i.e. black square
		color_out 		: out std_logic_vector (2 downto 0); --respectively RGB	
		row_out		: out std_logic_vector (7 downto 0)  --left to right		
		);
end component sprite;
	
component counter is

	port(
	clk				: in  std_logic;
	county				: out std_logic_vector(2 downto 0);
	dual_pixel_y				: out std_logic;
	current_block_horizontal 				: out std_logic_vector(4 downto 0);
	current_block_vertical   				: out std_logic_vector(4 downto 0);

	reset_dual_pixel_y				: in std_logic;
	reset_current_block_horizontal		: in std_logic;
	reset_current_block_vertical				: in std_logic;
	reset_county				: in std_logic;

	en_county				: in std_logic;
	en_current_block_horizontal				: in std_logic;
	en_current_block_vertical				: in std_logic;
	en_dual_pixel_y				: in std_logic);

end component;

component shift_system is
   port(clk		      : in std_logic;
	reset	      : in std_logic;

	xcoordinates_shift  : in  std_logic_vector(4 downto 0);
        ycoordinates_shift  : in  std_logic_vector(4 downto 0);
        cell_state_in_shift : in  std_logic_vector(2 downto 0);
        y_pos_in_shift      : in  std_logic_vector(2 downto 0);
        pixel_arr_in_shift  : in  std_logic_vector(7 downto 0);
	
	screen_sync	  : in std_logic;

	cell_state_out_shift: out std_logic_vector(2 downto 0);
        y_pos_out_shift     : out std_logic_vector(2 downto 0);
        pixel_arr_out_shift : out std_logic_vector(7 downto 0)


);
end component;

signal cell_type_test: std_logic_vector(2 downto 0);

signal y_pos_to_shift, y_pos_shifted, sprite_type_to_shift, sprite_type_to_register, colour, rgb_score, rgb_video, sprite_colour: std_logic_vector(2 downto 0);
signal sync, score_sync, calc_start_internal: std_logic;
signal pixel_array_to_shift, pixel_array_shifted: std_logic_vector(7 downto 0);
signal	county:  std_logic_vector(2 downto 0);
signal	dual_pixel_y: std_logic;
signal	current_block_horizontal, ycoordinates_internal, xcoordinates_internal: std_logic_vector(4 downto 0);
signal	current_block_vertical :  std_logic_vector(4 downto 0);
signal	reset_dual_pixel_y, reset_dual_pixel_y_score, reset_dual_pixel_y_video, reset_current_block_horizontal, reset_current_block_horizontal_score, reset_current_block_horizontal_video, reset_current_block_vertical, reset_county,	reset_county_score, reset_county_video, en_county, en_county_score, en_county_video, en_current_block_horizontal, en_current_block_horizontal_score, en_current_block_horizontal_video, en_current_block_vertical, en_dual_pixel_y, en_dual_pixel_y_score, en_dual_pixel_y_video: std_logic;	

begin

vidcontrol: video_control port map(clk, reset, sync, cell_type_test, sprite_colour, pixel_array_shifted, sprite_type_to_shift, y_pos_to_shift, rgb_video, xcoordinates_internal, ycoordinates_internal,
				  county, dual_pixel_y, current_block_horizontal, current_block_vertical, 
				  reset_dual_pixel_y_video, reset_current_block_horizontal_video, reset_current_block_vertical, reset_county_video,
				  en_county_video, en_current_block_horizontal_video, en_current_block_vertical, en_dual_pixel_y_video);

sprites: sprite port map(y_pos_shifted, sprite_type_to_register, sprite_colour, pixel_array_to_shift);

shift: shift_system port map (clk, reset, xcoordinates_internal, ycoordinates_internal, sprite_type_to_shift, y_pos_to_shift, pixel_array_to_shift, calc_start_internal, sprite_type_to_register, y_pos_shifted, pixel_array_shifted
);

vgacontrol: vga_controll port map(clk, reset, colour, sync, score_sync, red, green, blue, h_sync, v_sync, calc_start_internal);

cnt: counter port map( clk, county, dual_pixel_y, current_block_horizontal, current_block_vertical, 
			 reset_dual_pixel_y, reset_current_block_horizontal, reset_current_block_vertical, reset_county,
			 en_county, en_current_block_horizontal, en_current_block_vertical, en_dual_pixel_y);

score: score_system port map( clk, reset, score_plus, score_sync, dual_pixel_y, county, current_block_horizontal, rgb_score, reset_dual_pixel_y_score, reset_current_block_horizontal_score, reset_county_score, en_county_score, en_current_block_horizontal_score, en_dual_pixel_y_score);

colour(0)<= rgb_score(0) OR  rgb_video(0);
colour(1)<= rgb_score(1) OR  rgb_video(1);
colour(2)<= rgb_score(2) OR  rgb_video(2);

reset_dual_pixel_y <= reset_dual_pixel_y_score OR reset_dual_pixel_y_video;
reset_current_block_horizontal <= reset_current_block_horizontal_score OR reset_current_block_horizontal_video;
reset_county <= reset_county_score OR reset_county_video; 

en_dual_pixel_y <= en_dual_pixel_y_score OR en_dual_pixel_y_video;
en_current_block_horizontal <= en_current_block_horizontal_score OR en_current_block_horizontal_video;
en_county <= en_county_score OR en_county_video; 


xcoordinates <= xcoordinates_internal;
ycoordinates <= ycoordinates_internal;

calc_start <= calc_start_internal;

process(xcoordinates_internal, ycoordinates_internal)

begin

	if((xcoordinates_internal = "01111" OR xcoordinates_internal = "10000" ) AND ycoordinates_internal = "01111") then
		cell_type_test <= "001";
	else
		cell_type_test <= "010";
	end if;
end process;



end architecture structural;
