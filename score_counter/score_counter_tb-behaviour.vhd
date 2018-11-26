library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of score_counter_tb is
   component score_counter
      port(clk       : in  std_logic;
           reset     : in  std_logic;
           score_add : in  std_logic;
           score     : out std_logic_vector(9 downto 0));
   end component;
   signal clk       : std_logic;
   signal reset     : std_logic;
   signal score_add : std_logic;
   signal score     : std_logic_vector(9 downto 0);
begin
test: score_counter port map (clk, reset, score_add, score);
   clk <= '1' after 0 ns,
    '0' after 100 ns when clk /= '0' else '1' after 100 ns;
   reset <= '1' after 0 ns, '0' after 100 ns;
   score_add <= '0' after 0 ns, '1' after 200 ns when score_add /= '1' else '0' after 200 ns;
end behaviour;

