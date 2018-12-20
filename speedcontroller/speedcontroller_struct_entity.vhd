library IEEE;
use IEEE.std_logic_1164.all;

entity speedcontroller is
	port (
		clk		: in	std_logic;
		reset		: in	std_logic;
	
		p_rdy		: in 	std_logic;
		g_rdy		: in 	std_logic;
		coin_rst		: in 	std_logic;
		vc_done		: in	std_logic;
		
		p_strt		: out	std_logic;
		g1_strt		: out 	std_logic;
		g2_strt		: out	std_logic
	);
end entity speedcontroller;
