library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_count_gg is
   port(clk         : in  std_logic;
        count_reset : in  std_logic;
        sync : in  std_logic;
        shift_sync_gg  : out std_logic);
end shift_count_gg;

