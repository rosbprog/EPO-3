library IEEE;
use IEEE.std_logic_1164.ALL;

entity coin_register is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
	write_coin   : in  std_logic;
        row          : in  std_logic_vector(4 downto 0);
        column       : in  std_logic_vector(4 downto 0);
        coin_present : out std_logic;
	score_add 	  : out std_logic;
	zero_coins   : out std_logic);
end coin_register;

