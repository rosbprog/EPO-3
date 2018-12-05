library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of video_system_tb is
   component video_system
     port( clk       : in std_logic;
           reset     : in std_logic;
           cell_type : in std_logic_vector(2 downto 0);
	   score_plus : in std_logic;
           xcoordinates : out std_logic_vector(4 downto 0);
           ycoordinates : out std_logic_vector(4 downto 0);
           red       : out std_logic;
           green     : out std_logic;
           blue      : out std_logic;
           h_sync    : out std_logic;
           v_sync    : out std_logic;
	   calc_start : out std_logic);
   end component;
   signal clk       : std_logic;
   signal reset     : std_logic;
   signal cell_type : std_logic_vector(2 downto 0);
   signal xcoordinates : std_logic_vector(4 downto 0);
   signal ycoordinates : std_logic_vector(4 downto 0);
   signal red       : std_logic;
   signal green     : std_logic;
   signal blue      : std_logic;
   signal h_sync    : std_logic;
   signal v_sync    : std_logic;
   signal calc_start :std_logic;
   signal score_plus :std_logic;
begin
test: video_system port map (clk, reset, cell_type, score_plus, xcoordinates, ycoordinates, red, green, blue, h_sync, v_sync);
	clk <= '1' after 0 ns,
    	'0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns, '0' after 90 ns;
   cell_type(0) <= '1' after 0 ns;
   cell_type(1) <= '1' after 0 ns;
   cell_type(2) <= '0' after 0 ns;

end behaviour;

