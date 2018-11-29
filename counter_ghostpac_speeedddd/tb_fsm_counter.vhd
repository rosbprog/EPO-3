library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_counter_tb is
end entity fsm_counter_tb;

architecture structural of fsm_counter_tb is
	component fsm_counter is
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
	end component fsm_counter;
	
signal clk, reset, p_rdy, g1_rdy, coin_rst 	: std_logic;
signal count					: std_logic_vector(6 downto 0);

begin

	PG1: fsm_counter port map (
				clk		=> clk,
				reset		=> reset,	
				p_rdy		=> p_rdy,
				g1_rdy		=> g1_rdy,
				coin_rst	=> coin_rst,
				count		=> count
					);

	clk 	<=	'0' after 0 ns,
			'1' after 40 ns when clk /= '1' else '0' after 40 ns;
	reset 	<= 	'1' after 0 ns, 
			'0' after 120 ns;
	p_rdy 	<=	'0' after 0 ns,
			'1' after 400 ns,
			'0' after 480 ns;	
	g1_rdy 	<= 	'0' after 0 ns,
			'1' after 720 ns,
			'0' after 800 ns;
	coin_rst<=	'0' after 0 ns;
	count 	<=  	"0000000" after 0 ns,
			"0111100" after 160 ns,
			"0000000" after 180 ns;

end architecture structural;