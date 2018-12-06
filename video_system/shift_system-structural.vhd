library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of shift_system is

component shift_control is
   port(clk		      : in std_logic;
	reset	      : in std_logic;

	xcoordinates  : in  std_logic_vector(4 downto 0);
        ycoordinates  : in  std_logic_vector(4 downto 0);
        cell_state_in : in  std_logic_vector(2 downto 0);
        y_pos_in      : in  std_logic_vector(2 downto 0);
        pixel_arr_in  : in  std_logic_vector(7 downto 0);
	
	sprite_colour_in     : in  std_logic_vector(2 downto 0);


	pacman_pos_x	 : in std_logic_vector(4 downto 0);
	pacman_pos_y  : in std_logic_vector(4 downto 0);

	screen_sync	  : in std_logic;
	shift_pulse	  : in std_logic;
	
	sprite_colour_out : out std_logic(2 downto 0);

	pacman_pos_x_new: out std_logic_vector(4 downto 0);
	pacman_pos_y_new: out std_logic_vector(4 downto 0);
	pacman_pos_load	 	: out std_logic;
	pacman_pos_reset	 	: out std_logic;

	shift_clock_reset: out std_logic;

	cell_state_out: out std_logic_vector(2 downto 0);
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


signal	pacman_pos_x	 :  std_logic_vector(4 downto 0);
signal	pacman_pos_y  :  std_logic_vector(4 downto 0);
signal	shift_pulse	  :  std_logic;
signal	pacman_pos_x_new:  std_logic_vector(4 downto 0);
signal	pacman_pos_y_new:  std_logic_vector(4 downto 0);
signal	pacman_pos_load	 	:  std_logic;
signal	pacman_pos_reset	 	:  std_logic;

signal	shift_clock_reset:  std_logic;

begin


cntrl: shift_control port map(clk,
	reset,
	xcoordinates ,
        ycoordinates ,
        cell_state_in,
        y_pos_in ,
        pixel_arr_in ,

	sprite_colour_in,

	pacman_pos_x,
	pacman_pos_y,

	screen_sync,
	shift_pulse,
	
	sprite_colour_out,
			      
	pacman_pos_x_new,
	pacman_pos_y_new,
	pacman_pos_load,
	pacman_pos_reset,

	shift_clock_reset,

	cell_state_out,
        y_pos_out,
        pixel_arr_out);

cntr: shift_counter port map(clk, shift_clock_reset, screen_sync, shift_pulse);
reg: pacman_position_reg port map(	pacman_pos_x_new,
	pacman_pos_y_new,
	pacman_pos_load,
	pacman_pos_reset, clk, 
	pacman_pos_x,
	pacman_pos_y);



end structural;

