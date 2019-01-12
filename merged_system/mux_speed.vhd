library IEEE;
use IEEE.std_logic_1164.ALL;

entity multiplexer is
   	port(
		vc_done   : in  std_logic;
        		count_old : in  std_logic_vector(6 downto 0);
        		count_new : in  std_logic_vector(6 downto 0);
        		count     : out std_logic_vector(6 downto 0)
	);
end multiplexer;
