library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_system is
   port(clk		      : in std_logic;
	reset	      : in std_logic;

	xcoordinates_shift  : in  std_logic_vector(4 downto 0);
        ycoordinates_shift  : in  std_logic_vector(4 downto 0);
        cell_state_in_shift : in  std_logic_vector(2 downto 0);
        y_pos_in_shift      : in  std_logic_vector(2 downto 0);
        pixel_arr_in_shift  : in  std_logic_vector(7 downto 0);
	
	screen_sync	  : in std_logic;

	cell_state_out_shift: out std_logic_vector(5 downto 0);
   y_pos_out_shift     : out std_logic_vector(2 downto 0);
   pixel_arr_out_shift : out std_logic_vector(7 downto 0)

);
end shift_system;

