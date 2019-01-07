library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fsm_counter is
	port (	clk			: in	std_logic; --12.5 MHz clock signal
		reset			: in	std_logic; --System reset
		
		p_rdy			: in 	std_logic;
		g1_rdy			: in 	std_logic;
		coin_rst		: in 	std_logic; --reset when all coins picked up
		count			: in 	std_logic_vector(6 downto 0);

		p_strt			: out 	std_logic;
		g1_strt			: out 	std_logic;
		g2_strt			: out 	std_logic;
		c_rst			: out	std_logic); --counter reset
end entity fsm_counter;
