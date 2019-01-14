library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity vga_controll is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        rgb          : in  std_logic_vector(2 downto 0);
	enable_sync  : in std_logic;
        pixel_sync		 : out std_logic;
	score_pixel_sync	 : out std_logic;
        red          : out std_logic;
        green        : out std_logic;
        blue         : out std_logic;
        h_sync       : out std_logic;
        v_sync       : out std_logic;
	calc_start   : out std_logic;
       	go_pixel_sync: out std_logic;
       	calc_start_game : out std_logic);
end vga_controll;

