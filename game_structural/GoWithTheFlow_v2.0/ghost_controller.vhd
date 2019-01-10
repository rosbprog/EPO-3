library IEEE;
use IEEE.std_logic_1164.ALL;

entity ghost_cont is
   port(clk         : in  std_logic;
        reset       : in  std_logic;
        ghost_start		  : in  std_logic;
        pos_is_wall	: in  std_logic;
        en_cor_ghost   : out std_logic;
        ghost_ready    : out std_logic;
        en_wall     : out std_logic);
end ghost_cont;
