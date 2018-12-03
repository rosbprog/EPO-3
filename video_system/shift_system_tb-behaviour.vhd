library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of shift_system_tb is
   component shift_system
      port(clk		      : in std_logic;
   	reset	      : in std_logic;
   
   	xcoordinates  : in  std_logic_vector(4 downto 0);
           ycoordinates  : in  std_logic_vector(4 downto 0);
           cell_state_in : in  std_logic_vector(2 downto 0);
           y_pos_in      : in  std_logic_vector(2 downto 0);
           pixel_arr_in  : in  std_logic_vector(7 downto 0);
   
   	screen_sync	  : in std_logic;
   
   	cell_state_out: out std_logic_vector(2 downto 0);
           y_pos_out     : out std_logic_vector(2 downto 0);
           pixel_arr_out : out std_logic_vector(7 downto 0));
   end component;
   signal clk		      : std_logic;
   signal reset	      : std_logic;
   signal xcoordinates  : std_logic_vector(4 downto 0);
   signal ycoordinates  : std_logic_vector(4 downto 0);
   signal cell_state_in : std_logic_vector(2 downto 0);
   signal y_pos_in      : std_logic_vector(2 downto 0);
   signal pixel_arr_in  : std_logic_vector(7 downto 0);
   signal screen_sync	  : std_logic;
   signal cell_state_out: std_logic_vector(2 downto 0);
   signal y_pos_out     : std_logic_vector(2 downto 0);
   signal pixel_arr_out : std_logic_vector(7 downto 0);
begin
test: shift_system port map (clk, reset, xcoordinates, ycoordinates, cell_state_in, y_pos_in, pixel_arr_in, screen_sync, cell_state_out, y_pos_out, pixel_arr_out);
 clk <= '1' after 0 ns,
     '0' after 100 ns when clk /= '0' else '1' after 100 ns;

   reset <= '1' after 0 ns,
	'0' after 50 ns;

   xcoordinates(0) <= '0' after 0 ns,
			'1' after 350 ns;
   xcoordinates(1) <= '0' after 0 ns;
   xcoordinates(2) <= '0' after 0 ns;
   xcoordinates(3) <= '0' after 0 ns;
   xcoordinates(4) <= '0' after 0 ns;
   ycoordinates(0) <= '0' after 0 ns;
   ycoordinates(1) <= '0' after 0 ns;
   ycoordinates(2) <= '0' after 0 ns;
   ycoordinates(3) <= '0' after 0 ns;
   ycoordinates(4) <= '0' after 0 ns;



   cell_state_in(0) <= '1' after 0 ns;
   cell_state_in(1) <= '0' after 0 ns;
   cell_state_in(2) <= '0' after 0 ns;
   y_pos_in(0) <= '0' after 0 ns;
   y_pos_in(1) <= '1' after 0 ns;
   y_pos_in(2) <= '0' after 0 ns;
   pixel_arr_in(0) <= '1' after 0 ns;
   pixel_arr_in(1) <= '0' after 0 ns;
   pixel_arr_in(2) <= '1' after 0 ns;
   pixel_arr_in(3) <= '0' after 0 ns;
   pixel_arr_in(4) <= '1' after 0 ns;
   pixel_arr_in(5) <= '0' after 0 ns;
   pixel_arr_in(6) <= '1' after 0 ns;
   pixel_arr_in(7) <= '0' after 0 ns;
   screen_sync <= '1' after 0 ns;

end behaviour;

