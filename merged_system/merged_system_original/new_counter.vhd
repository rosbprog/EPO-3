library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity new_counter is
	port(	clk		: in	std_logic;
		count_reset	: in 	std_logic; 
		vc_done		: in	std_logic;
		forty		: out	std_logic;
		sixty		: out	std_logic;
		eighty		: out	std_logic;
		hundredandtwenty		: out	std_logic);
end entity new_counter;
