library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_control is
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

	pacman_pos_x_new: out std_logic_vector(4 downto 0);
	pacman_pos_y_new: out std_logic_vector(4 downto 0);
	pacman_load	 	: out std_logic;
	pacman_reset	 	: out std_logic;

	cell_state_out: out std_logic_vector(2 downto 0);
        y_pos_out     : out std_logic_vector(2 downto 0);
        pixel_arr_out : out std_logic_vector(7 downto 0));
end shift_control;

