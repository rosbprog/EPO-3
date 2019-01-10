library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of shift_system is
   component shift_count_gg
      port(clk         : in  std_logic;
           count_reset : in  std_logic;
           sync : in  std_logic;
           shift_sync_gg  : out std_logic);
   end component;

   component shift_ctrl_gg
      port(clk		      : in std_logic;
   	reset	      : in std_logic;
   
   	xcoordinates  : in  std_logic_vector(4 downto 0);
           ycoordinates  : in  std_logic_vector(4 downto 0);
           cell_state_in : in  std_logic_vector(2 downto 0);
           y_pos_in      : in  std_logic_vector(2 downto 0);
           pixel_arr_in  : in  std_logic_vector(7 downto 0);
   
   
   	gg_pos_x	 : in std_logic_vector(4 downto 0);
   	gg_pos_y  : in std_logic_vector(4 downto 0);
   
   	screen_sync	  : in std_logic;
   	shift_pulse	  : in std_logic;
   
   	gg_pos_x_new: out std_logic_vector(4 downto 0);
   	gg_pos_y_new: out std_logic_vector(4 downto 0);
   	gg_pos_load	 	: out std_logic;
   	gg_pos_reset	 	: out std_logic;
   
   	shift_gg_clock_reset: out std_logic;
   
   	cell_state_out_gg: out std_logic_vector(2 downto 0);
           y_pos_out_gg     : out std_logic_vector(2 downto 0);
           pixel_arr_out_gg : out std_logic_vector(7 downto 0));
   end component;

   component gg_pos_reg
   port(   gg_pos_x_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
           gg_pos_y_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
                gg_load : IN STD_LOGIC;
               gg_reset : IN STD_LOGIC;
                        clk : IN STD_LOGIC;
               gg_pos_x : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
               gg_pos_y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
         );
   end component;


component shift_count_gr
      port(clk         : in  std_logic;
           count_reset : in  std_logic;
           sync : in  std_logic;
           shift_sync_gr  : out std_logic);
   end component;

component shift_ctrl_gr
      port(clk		      : in std_logic;
   	reset	      : in std_logic;
   
   	xcoordinates  : in  std_logic_vector(4 downto 0);
           ycoordinates  : in  std_logic_vector(4 downto 0);
           cell_state_in : in  std_logic_vector(2 downto 0);
           y_pos_in      : in  std_logic_vector(2 downto 0);
           pixel_arr_in  : in  std_logic_vector(7 downto 0);
   
   
   	gr_pos_x	 : in std_logic_vector(4 downto 0);
   	gr_pos_y  : in std_logic_vector(4 downto 0);
   
   	screen_sync	  : in std_logic;
   	shift_pulse	  : in std_logic;
   
   	gr_pos_x_new: out std_logic_vector(4 downto 0);
   	gr_pos_y_new: out std_logic_vector(4 downto 0);
   	gr_pos_load	 	: out std_logic;
   	gr_pos_reset	 	: out std_logic;
   
   	shift_gr_clock_reset: out std_logic;
   
   	cell_state_out_gr: out std_logic_vector(2 downto 0);
           y_pos_out_gr     : out std_logic_vector(2 downto 0);
           pixel_arr_out_gr : out std_logic_vector(7 downto 0));
   end component;

component gr_pos_reg
   port(   gr_pos_x_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
           gr_pos_y_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
                gr_load : IN STD_LOGIC;
               gr_reset : IN STD_LOGIC;
                        clk : IN STD_LOGIC;
               gr_pos_x : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
               gr_pos_y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
         );
   end component;


component shift_control is
   port(clk		      : in std_logic;
	reset	      : in std_logic;

	xcoordinates  : in  std_logic_vector(4 downto 0);
        ycoordinates  : in  std_logic_vector(4 downto 0);
        cell_state_in : in  std_logic_vector(2 downto 0);
        y_pos_in      : in  std_logic_vector(2 downto 0);
        pixel_arr_in  : in  std_logic_vector(7 downto 0);


	pacman_pos_x	 : in std_logic_vector(4 downto 0);
	pacman_pos_y  : in std_logic_vector(4 downto 0);

	screen_sync	  : in std_logic;
	shift_pulse	  : in std_logic;
	

	pacman_pos_x_new: out std_logic_vector(4 downto 0);
	pacman_pos_y_new: out std_logic_vector(4 downto 0);
	pacman_pos_load	 	: out std_logic;
	pacman_pos_reset	 	: out std_logic;
	shift_clock_reset  : out std_logic;

	cell_state_out: out std_logic_vector(5 downto 0);
        y_pos_out     : out std_logic_vector(2 downto 0);
        pixel_arr_out : out std_logic_vector(7 downto 0));
end component;

component shift_counter is
   port(clk         : in  std_logic;
        count_reset : in  std_logic;
        sync : in  std_logic;
        shift_sync  : out std_logic);
end component;

component pacman_position_reg is
port(   pacman_pos_x_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        pacman_pos_y_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
             pacman_load : IN STD_LOGIC;
            pacman_reset : IN STD_LOGIC;
                     clk : IN STD_LOGIC;
            pacman_pos_x : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
            pacman_pos_y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
end component;


signal	pacman_pos_x,	gr_pos_x, gg_pos_x	 :  std_logic_vector(4 downto 0);
signal	pacman_pos_y, gr_pos_y, gg_pos_y :  std_logic_vector(4 downto 0);
signal	shift_pulse, shift_pulse_gr, shift_pulse_gg :  std_logic;
signal	pacman_pos_x_new, gr_pos_x_new, gg_pos_x_new:  std_logic_vector(4 downto 0);
signal	pacman_pos_y_new, gr_pos_y_new, gg_pos_y_new:  std_logic_vector(4 downto 0);
signal	pacman_pos_load, gr_pos_load	, gg_pos_load :  std_logic;
signal	pacman_pos_reset, gr_pos_reset, gg_pos_reset	 :  std_logic;
signal	shift_clock_reset, shift_clock_reset_gr,  shift_clock_reset_gg:  std_logic;

signal	cell_state_out_shift_pacman, cell_state_out_shift_gr, cell_state_out_shift_gg, cell_state_out_shift_internal: std_logic_vector(2 downto 0);
signal  y_pos_out_shift_pacman, y_pos_out_shift_gr, y_pos_out_shift_gg, y_pos_out_shift_internal: std_logic_vector(2 downto 0);
signal  pixel_arr_out_shift_pacman, pixel_arr_out_shift_gr, pixel_arr_out_shift_gg, pixel_arr_out_shift_internal: std_logic_vector(7 downto 0);

begin


L11: shift_control port map(clk,
	reset,
	xcoordinates_shift ,
        ycoordinates_shift ,
        cell_state_in_shift,
        y_pos_in_shift ,
        pixel_arr_in_shift ,

	pacman_pos_x,
	pacman_pos_y,

	screen_sync,
	shift_pulse,
			      
	pacman_pos_x_new,
	pacman_pos_y_new,
	pacman_pos_load,
	pacman_pos_reset,

	shift_clock_reset,

	cell_state_out_shift_pacman,
        y_pos_out_shift_pacman,
        pixel_arr_out_shift_pacman);

L12: shift_counter port map(clk, shift_clock_reset, screen_sync, shift_pulse);

L13: pacman_position_reg port map(	pacman_pos_x_new,
	pacman_pos_y_new,
	pacman_pos_load,
	pacman_pos_reset, clk, 
	pacman_pos_x,
	pacman_pos_y);
L21: shift_count_gr port map( clk, shift_clock_reset_gr, screen_sync, shift_pulse_gr);

L22: gr_pos_reg port map(gr_pos_x_new,
	gr_pos_y_new,
	gr_pos_load,
	gr_pos_reset,
	clk,
	gr_pos_x,
	gr_pos_y);

L23: shift_ctrl_gr port map(clk,
	reset,
	xcoordinates_shift ,
        ycoordinates_shift ,
        cell_state_in_shift,
        y_pos_in_shift ,
        pixel_arr_in_shift ,

	gr_pos_x,
	gr_pos_y,

	screen_sync,
	shift_pulse_gr,
			      
	gr_pos_x_new,
	gr_pos_y_new,
	gr_pos_load,
	gr_pos_reset,

	shift_clock_reset_gr,

	cell_state_out_shift_gr,
        y_pos_out_shift_gr,
        pixel_arr_out_shift_gr);

L31: shift_count_gg port map( clk, shift_clock_reset_gg, screen_sync, shift_pulse_gg);

L32: gg_pos_reg port map(gg_pos_x_new,
	gg_pos_y_new,
	gg_pos_load,
	gg_pos_reset,
	clk,
	gg_pos_x,
	gg_pos_y);

L33: shift_ctrl_gg port map(clk,
	reset,
	xcoordinates_shift ,
        ycoordinates_shift ,
        cell_state_in_shift,
        y_pos_in_shift ,
        pixel_arr_in_shift ,

	gg_pos_x,
	gg_pos_y,

	screen_sync,
	shift_pulse_gg,
			      
	gg_pos_x_new,
	gg_pos_y_new,
	gg_pos_load,
	gg_pos_reset,

	shift_clock_reset_gg,

	cell_state_out_shift_gg,
        y_pos_out_shift_gg,
        pixel_arr_out_shift_gg);

process(	y_pos_out_shift_pacman,
	cell_state_out_shift_pacman,
	pixel_arr_out_shift_pacman,
	y_pos_out_shift_gr,
	cell_state_out_shift_gr,
	pixel_arr_out_shift_gr)

begin

if cell_state_out_shift_pacman = "001" then
	y_pos_out_shift_internal <= y_pos_out_shift_pacman;
	cell_state_out_shift_internal <= cell_state_out_shift_pacman;
	pixel_arr_out_shift_internal <= pixel_arr_out_shift_pacman;
elsif cell_state_out_shift_gr = "010" then
	y_pos_out_shift_internal <= y_pos_out_shift_gr;
	cell_state_out_shift_internal <= cell_state_out_shift_gr;
	pixel_arr_out_shift_internal <= pixel_arr_out_shift_gr;
elsif cell_state_out_shift_gg = "011" then
	y_pos_out_shift_internal <= y_pos_out_shift_gg;
	cell_state_out_shift_internal <= cell_state_out_shift_gg;
	pixel_arr_out_shift_internal <= pixel_arr_out_shift_gg;
else
	y_pos_out_shift_internal <= y_pos_out_shift_pacman;
	cell_state_out_shift_internal <= cell_state_out_shift_pacman;
	pixel_arr_out_shift_internal <= pixel_arr_out_shift_pacman;
end if;

end process;
cell_state_out_shift <= cell_state_out_shift_internal;
y_pos_out_shift <= y_pos_out_shift_internal;
pixel_arr_out_shift <= pixel_arr_out_shift_internal;

end structural;

