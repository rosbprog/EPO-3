library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behaviour of score_count is

signal in_a, in_b, in_c, new_a, new_b, new_c: unsigned(3 downto 0);

begin
L1: process(clk,reset)
begin
	if (rising_edge(clk)) then
		if (reset='1') then
			in_a<="0000";
			in_b<="0000";
			in_c<="0000";
		else 
			in_a<=new_a;
			in_b<=new_b;
			in_c<=new_c;
		end if;
	end if;
end process;

L2: process(plus)
begin
	if (plus='1') then
		if (in_a<"1001") then
			new_a<=in_a+1;
			new_b<=in_b;
			new_c<=in_c;
		elsif (in_a="1001" and in_b<"1001") then
			new_a<="0000";
			new_b<=in_b+1;
			new_c<=in_c;
		elsif (in_b="1001" and in_c<"1001" and in_a="1001") then
			new_a<=in_a;
			new_b<="0000";
			new_c<=in_c+1;
		else
			in_a<="0000";
			in_b<="0000";
			in_c<="0000";
		end if;
	else
		new_a<=in_a;
		new_b<=in_b;
		new_c<=in_c;
	end if;
end process;
a<=in_a;
b<=in_b;
c<=in_c;

end architecture behaviour;
