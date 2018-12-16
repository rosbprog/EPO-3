library IEEE;
use IEEE.std_logic_1164.all;

entity speedcontroller_tb is
end entity speedcontroller_tb;

architecture structural of speedcontroller_tb is
	component speedcontroller is
		port (
			clk		: in	std_logic;
			reset		: in	std_logic;
		
			p_rdy		: in 	std_logic;
			g_rdy		: in 	std_logic;
			coin_rst	: in 	std_logic;
			vc_done		: in	std_logic;
			
			p_strt		: out	std_logic;
			g1_strt		: out 	std_logic;
			g2_strt		: out	std_logic
		);
	end component speedcontroller;

	signal 	clk, reset, p_rdy, g_rdy, coin_rst, 
		vc_done, p_strt, g1_strt, g2_strt : std_logic;

begin
	lb1: speedcontroller port map (
		clk 	=> clk,
		reset	=> reset,
		p_rdy	=> p_rdy,
		g_rdy	=> g_rdy,
		coin_rst=> coin_rst,
		vc_done => vc_done,
		p_strt  => p_strt,
		g1_strt => g1_strt,
		g2_strt => g2_strt
	);	
		
	reset  	<=	'1' after 0 ns,
			'0' after 10 ns;
	coin_rst<=	'0' after 0 ns,
			'1' after 80 ns,
			'0' after 120 ns; ---The fsm where both move as
	clk	<=	'0' after 0 ns,	  -- fast is entered
			'1' after 40 ns when clk /= '1' else '0' after 40 ns;
	vc_done	<=	'0' after 0 ns,
			'1' after 8 ms when vc_done /= '1' else '0' after 8 ms;
	p_rdy	<=	'0' after 0 ns,
			'1' after 960 ms, ---60 times 16 ms = 960ms
			'0' after 960.01 ms; 
	g_rdy 	<= 	'0' after 0 ns,
			'1' after 962 ms,
			'0' after 962.01 ms;		
end architecture structural;

			

