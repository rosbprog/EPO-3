library IEEE;
use IEEE.std_logic_1164.all;

entity inputcontroller_tb is
end entity inputcontroller_tb;

architecture structural of inputcontroller_tb is
	component input_controller is
		port (
			clk			: in	std_logic;
			reset			: in	std_logic;

			move_in			: in	std_logic_vector(3 downto 0);
			move_out		: out	std_logic_vector(3 downto 0)
		);
	end component input_controller;

	signal 	clk, reset : std_logic; 
	signal	move_in, move_out : std_logic_vector(3 downto 0);
begin 
	lb1: input_controller port map (
		clk 	=> clk,
		reset	=> reset,
		move_in	=> move_in,
		move_out=> move_out
	);	
	clk	<=	'0' after 0 ns,
			'1' after 5 ns when clk /= '1' else '0' after 5 ns; 
	reset 	<=	'1' after 0 ns,
			'0'after 20 ns;
	move_in	<=	"0000" after 0 ns,
			"0011" after 34 ns, --stay in start
			"0001" after 44 ns, --right
			"0010" after 54 ns, --up
			"1001" after 62 ns, --up
			"1000" after 78 ns, --down
			"0100" after 83 ns, --left
			"0101" after 93 ns; --left 
end architecture structural;


