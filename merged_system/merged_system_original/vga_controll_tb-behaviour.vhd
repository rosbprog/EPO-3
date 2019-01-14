library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of vga_controll_tb is
   component vga_controll
      port(clk          : in  std_logic;
           reset        : in  std_logic;
           rgb          : in  std_logic_vector(2 downto 0);
           pixel_sync	 	: out std_logic;
	   score_pixel_sync : out std_logic;
           red          : out std_logic;
           green        : out std_logic;
           blue         : out std_logic;
           h_sync       : out std_logic;
           v_sync       : out std_logic;
	   calc_start		: out std_logic;
	   calc_start_game : out std_logic);
   end component;
   signal clk          : std_logic;
   signal reset        : std_logic;
   signal rgb          : std_logic_vector(2 downto 0);
   signal pixel_sync		 : std_logic;
   signal score_pixel_sync	 : std_logic;
   signal red          : std_logic;
   signal green        : std_logic;
   signal blue         : std_logic;
   signal h_sync       : std_logic;
   signal v_sync       : std_logic;
   signal calc_start	  : std_logic;
   signal calc_start_game : std_logic;
begin
test: vga_controll port map (clk, reset, rgb, pixel_sync, score_pixel_sync, red, green, blue, h_sync, v_sync, calc_start, calc_start_game);
   clk <= '1' after 0 ns, '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns, '0' after 90 ns;
   rgb(0) <= '1' after 0 ns;
   rgb(1) <= '1' after 0 ns;
   rgb(2) <= '1' after 0 ns;
end behaviour;

