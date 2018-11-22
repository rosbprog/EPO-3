library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity video_system is 
  port( clk       : in std_logic;
        reset     : in std_logic;
        cell_type : in std_logic_vector(2 downto 0);
        xcoordinates : out std_logic_vector(4 downto 0);
        ycoordinates : out std_logic_vector(4 downto 0);
        red       : out std_logic;
        green     : out std_logic;
        blue      : out std_logic;
        h_sync    : out std_logic;
        v_sync    : out std_logic);
end video_system;

architecture structural of video_system is


component vga_controll is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        rgb          : in  std_logic_vector(2 downto 0);
        pixel_sync		 : out std_logic;
        red          : out std_logic;
        green        : out std_logic;
        blue         : out std_logic;
        h_sync       : out std_logic;
        v_sync       : out std_logic);
end vga_controll;

component vc is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        sync         : in  std_logic;
        cell_type    : in  std_logic_vector(2 downto 0);
        sprite_colour: in  std_logic_vector(2 downto 0);
        pixel_array  : in  std_logic_vector(7 downto 0);
        sprite_type  : out std_logic_vector(2 downto 0);
        y_pos        : out std_logic_vector(2 downto 0);
        colour       : out std_logic_vector(2 downto 0);
        xcoordinates : out std_logic_vector(4 downto 0);
				ycoordinates : out std_logic_vector(4 downto 0));
end vc;

component sprite is
	port(  	y_pos		:in std_logic_vector (2 downto 0); 
		--Upper row is 111, lower is 000
	 	sprite_select	:in std_logic_vector (2 downto 0); 
		--000 coin, 001 ghost_red, 010 ghost_green, 011 pacman, 100 wall
		--101/110/111 becomes open i.e. black square
		color_out 	:out std_logic_vector (2 downto 0); --respectively RGB	
		row_out		:out std_logic_vector (7 downto 0)  --left to right		
		);
end sprite;

signal y_pos,sprite_type, colour, sprite_colour: std_logic_vector(2 downto 0);
signal sync: std_logic;
signal pixel_array: std_logic_vector(7 downto 0);
signal xcoordinates, ycoordinates: std_logic_vector(4 downto 0);

begin

vidcontrol: vc port map(clk, reset, sync, cell_type, sprite_colour, pixel_array, sprite_type, y_pos, colour, xcoordinates, ycoordinates);
sprites: sprite port map(y_pos, sprite_type, sprite_colour, pixel_array);
vgacontrol: vga_controll port map(clk, reset, colour, sync, red, green, blue, h_sync, v_sync);

end architecture structural;
