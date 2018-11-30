library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of ghost_cont_tb is
   component ghost_cont
      port(clk         : in  std_logic;
           reset       : in  std_logic;
           ghost_start		  : in  std_logic;
           pos_is_wall	: in  std_logic;
           en_cor_ghost   : out std_logic;
           ghost_ready    : out std_logic;
           en_wall     : out std_logic);
   end component;
   signal clk         : std_logic;
   signal reset       : std_logic;
   signal ghost_start		  : std_logic;
   signal pos_is_wall	: std_logic;
   signal en_cor_ghost   : std_logic;
   signal ghost_ready    : std_logic;
   signal en_wall     : std_logic;
begin
test: ghost_cont port map (clk, reset, ghost_start, pos_is_wall, en_cor_ghost, ghost_ready, en_wall);
	clk <=  '1' after 0 ns,
		'0' after 40 ns when clk /= '0' else '1' after 40 ns;

	reset <= '1' after 0 ns,
		 '0' after 90 ns;
	ghost_start <=  '0' after 0 ns,
			'1' after 100 ns,
			'0' after 200 ns,
			'1' after 300 ns,
			'0' after 400 ns,
			'1' after 500 ns,
			'0' after 600 ns,
			'1' after 700 ns;
			
	pos_is_wall <=  '0' after 0 ns,
			'1' after 150 ns,
			'0' after 250 ns,
			'1' after 450 ns,
			'0' after 550 ns;
end behaviour;

