library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of multiplexer is
begin
	count	<= count_old when vc_done = '0' else count_new;
end behaviour;

