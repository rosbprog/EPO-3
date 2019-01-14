library IEEE;
use IEEE.std_logic_1164.ALL;

entity pacman_cont is
   port(p_start     : in  std_logic;
        pos_is_wall : in  std_logic;
        sadness     : in  std_logic;
        clk         : in  std_logic;
        reset       : in  std_logic;
        p_ready     : out std_logic;
        write_coin  : out std_logic;
	write_power : out std_logic;
        en_wall     : out std_logic;
        rip         : out std_logic;
        en_cor      : out std_logic);
end pacman_cont;
