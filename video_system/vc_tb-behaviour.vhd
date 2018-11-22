library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of vc_tb is
   component vc
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
   end component;
   signal clk          : std_logic;
   signal reset        : std_logic;
   signal sync         : std_logic;
   signal cell_type    : std_logic_vector(2 downto 0);
   signal sprite_colour: std_logic_vector(2 downto 0);
   signal pixel_array  : std_logic_vector(7 downto 0);
   signal sprite_type  : std_logic_vector(2 downto 0);
   signal y_pos        : std_logic_vector(2 downto 0);
   signal colour       : std_logic_vector(2 downto 0);
   signal xcoordinates : std_logic_vector(4 downto 0);
   signal ycoordinates : std_logic_vector(4 downto 0);
begin
test: vc port map (clk, reset, sync, cell_type, sprite_colour, pixel_array, sprite_type, y_pos, colour, xcoordinates, ycoordinates);
  clk <=  '1' after 0 ns,
          '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
	'0' after 120 ns;
   sync <= '0' after 0 ns,
	'1' after 200 ns,
	'0' after 1000 ns,
	'1' after 5.7 ms;
   cell_type(0) <= '0' after 0 ns;
   cell_type(1) <= '1' after 0 ns;
   cell_type(2) <= '0' after 0 ns;
   sprite_colour(0) <= '0' after 0 ns;
   sprite_colour(1) <= '1' after 0 ns;
   sprite_colour(2) <= '0' after 0 ns;
   pixel_array(0) <= '0' after 0 ns;
   pixel_array(1) <= '0' after 0 ns;
   pixel_array(2) <= '0' after 0 ns;
   pixel_array(3) <= '1' after 0 ns;
   pixel_array(4) <= '1' after 0 ns;
   pixel_array(5) <= '1' after 0 ns;
   pixel_array(6) <= '0' after 0 ns;
   pixel_array(7) <= '1' after 0 ns;
end behaviour;

