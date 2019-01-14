library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

architecture behaviour of shift_count_gr is

signal count_internal, new_count_internal: std_logic_vector(2 downto 0);
signal dual, new_dual, new_shift_sync: std_logic;

begin

process(clk, count_reset)

begin
if clk'event and clk = '1' then
	if count_reset = '1' then
		count_internal<="000";
		dual<='0';
		shift_sync_gr<='0';
	else
		count_internal<= new_count_internal;
		dual<= new_dual;
		shift_sync_gr<=new_shift_sync;
	end if;
end if;

end process;


process(count_internal, sync, dual)

begin

if sync = '1' then
	if dual = '0' then
		if count_internal = "111" then
			new_shift_sync <= '1';
			new_count_internal <= "000";
			new_dual<='1';
		else
			new_count_internal <= count_internal + 1;
			new_dual <= '0';
			new_shift_sync<='0';
		end if;
	else 
		if count_internal >= "110" then
			new_shift_sync <= '1';
			new_count_internal <= "000";
			new_dual<='0';
		else
			new_count_internal <= count_internal + 1;
			new_dual<='1';
			new_shift_sync<='0';
		end if;
	end if;
else 
	new_count_internal<= count_internal;
	new_shift_sync<='0';
	new_dual <= dual;
end if;

end process;



end behaviour;


