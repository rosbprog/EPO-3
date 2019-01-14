library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of multiplexer is
begin
	process(vc_done, count_old, count_new)
	begin
		if (vc_done = '0') then
			count <= count_old;
		else
			count <= count_new;
		end if;
	end process;
end behaviour;
