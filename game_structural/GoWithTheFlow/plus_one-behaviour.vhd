library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of plus_one is
begin
	process(count_in)
	begin
		count_out	<= std_logic_vector(unsigned(count_in)+1);
	end process;
end behaviour;
