library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_system is
   port(clk		      : in std_logic;
	reset	      : in std_logic;

	xcoordinates  : in  std_logic_vector(4 downto 0);
        ycoordinates  : in  std_logic_vector(4 downto 0);
        cell_state_in : in  std_logic_vector(2 downto 0);
        y_pos_in      : in  std_logic_vector(2 downto 0);
        pixel_arr_in  : in  std_logic_vector(7 downto 0);
	sprite_colour_in     : in  std_logic_vector(2 downto 0);
	
	screen_sync	  : in std_logic;
	
	sprite_colour_out : out std_logic(2 downto 0);

	cell_state_out: out std_logic_vector(2 downto 0);
        y_pos_out     : out std_logic_vector(2 downto 0);
        pixel_arr_out : out std_logic_vector(7 downto 0));
end shift_system;

