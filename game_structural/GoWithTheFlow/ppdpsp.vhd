library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity plus_one is
   port(count_in  : in  std_logic_vector(6 downto 0);
        count_out : out std_logic_vector(6 downto 0));
end plus_one;
