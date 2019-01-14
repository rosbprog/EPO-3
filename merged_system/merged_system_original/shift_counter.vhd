library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_counter is
   port(clk         : in  std_logic;
        count_reset : in  std_logic;
        sync : in  std_logic;
        shift_sync  : out std_logic);
end shift_counter;

