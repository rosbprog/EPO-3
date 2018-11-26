library IEEE;
use IEEE.std_logic_1164.ALL;

entity score_counter is
   port(clk       : in  std_logic;
        reset     : in  std_logic;
        score_add : in  std_logic;
        score     : out std_logic_vector(9 downto 0));
end score_counter;

