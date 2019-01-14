library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of total_system_tb is
   component total_system
   
   port(
   	clk : in std_logic;
   	reset: in std_logic;
   	dir_pacman: in std_logic_vector(3 downto 0);
   	dir_ghost1: in std_logic_vector(3 downto 0);
   	dir_ghost2: in std_logic_vector(3 downto 0);
   	user_begin: in std_logic;
   	red: out std_logic;
   	green: out std_logic;
   	blue: out std_logic; 
   	h_sync: out std_logic;
   	v_sync: out std_logic ); 
   
   end component;


   signal clk : std_logic;
   signal reset: std_logic;
   signal pacman: std_logic_vector(3 downto 0);
   signal dir_ghost1: std_logic_vector(3 downto 0);
   signal dir_ghost2: std_logic_vector(3 downto 0);
   signal red: std_logic;
   signal green: std_logic;
   signal blue: std_logic;
   signal h_sync: std_logic;
   signal v_sync: std_logic;
begin
test: total_system port map (clk, reset, pacman, dir_ghost1, dir_ghost2, red, green, blue, h_sync, v_sync);
   clk <= '1' after 0 ns,
          '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns, '0' after 80 ns;
   pacman(0) <= '0' after 0 ns, '1' after 200 ms, '0' after 2000 ms;
   pacman(1) <= '0' after 0 ns, '1' after 2000 ms;
   pacman(2) <= '0' after 0 ns;
   pacman(3) <= '0' after 0 ns;
   dir_ghost1(0) <= '0' after 0 ns, '1' after 200 ms, '0' after 2000 ms;
   dir_ghost1(1) <= '0' after 0 ns, '1' after 2000 ms;
   dir_ghost1(2) <= '0' after 0 ns;
   dir_ghost1(3) <= '0' after 0 ns;
   dir_ghost2(0) <= '0' after 0 ns, '1' after 200 ms, '0' after 2000 ms;
   dir_ghost2(1) <= '0' after 0 ns, '1' after 2000 ms;
   dir_ghost2(2) <= '0' after 0 ns;
   dir_ghost2(3) <= '0' after 0 ns;
end behaviour;

