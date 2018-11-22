library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all; 
use IEEE.STD_LOGIC_ARITH.ALL; 

architecture behaviour of coin_register_tb is
   component coin_register
      port(clk          : in  std_logic;
           reset        : in  std_logic;
   	   write_coin   : in  std_logic;
           row          : in  std_logic_vector(4 downto 0);
           column       : in  std_logic_vector(4 downto 0);
           coin_present : out std_logic;
	   score_add    : out std_logic);
   end component;
   signal clk          : std_logic;
   signal reset        : std_logic;
   signal write_coin   : std_logic;
   signal row          : std_logic_vector(4 downto 0);
   signal column       : std_logic_vector(4 downto 0);
   signal coin_present, score_add : std_logic;


begin
test: coin_register port map (clk, reset, write_coin, row, column, coin_present, score_add);
   clk <= '1' after 0 ns,
   	'0' after 100 ns when clk /= '0' else '1' after 100 ns;
   reset <= '1' after 0 ns, '0' after 300 ns;
   write_coin <= '1' after 0 ns, '0' after 1500 ns;
   column <= "00000" after 0 ns, "00011" after 500 ns, "00001" after 1500 ns, "00011" after 2000 ns;
   row <= "00001" after 0 ns, "00011" after 1000 ns, "00001" after 2000 ns;
   

end behaviour;


