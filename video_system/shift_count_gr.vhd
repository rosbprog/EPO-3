library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_count_gr is
   port(clk         : in  std_logic;
        count_reset : in  std_logic;
        sync : in  std_logic;
        shift_sync_gr  : out std_logic);
end shift_count_gr;

