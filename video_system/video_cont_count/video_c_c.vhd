library IEEE;
use IEEE.std_logic_1164.ALL;

entity video_c_c is

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
end video_c_c;

