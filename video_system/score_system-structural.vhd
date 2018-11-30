library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of score_system is
   component score_sprite
   	port(  	y_pos			: in std_logic_vector (2 downto 0);
   	 	score_sprite_select	: in std_logic_vector (3 downto 0);
   		row_out			: out std_logic_vector (7 downto 0)
   		);
   end component;

   component score_control
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
   	
   end component;

   component score_count
   port(
   	clk 	: in std_logic;
   	reset	: in std_logic;
   	plus	: in std_logic;
   	a,b,c	: out std_logic_vector(3 downto 0)
   );
   end component;

signal score_y_pos : std_logic_vector(2 downto 0);
signal score_sprite_type, score_a, score_b, score_c : std_logic_vector( 3 downto 0);
signal pixel_array : std_logic_vector( 7 downto 0);






begin

L1: score_sprite port map( score_y_pos, score_sprite_type, pixel_array);

L2: score_count port map( clk, reset, score_plus, score_a, score_b, score_c);

L3: score_control port map( clk, reset, score_sync_vga, score_a, score_b, score_c, pixel_array, dual_pixel_y, county, current_block_horizontal, rgb_score, score_sprite_type, score_y_pos, reset_dual_pixel_y, reset_current_block_horizontal, reset_county, en_county, en_current_block_horizontal, en_dual_pixel_y);

end structural;

