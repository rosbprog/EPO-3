library IEEE;
use IEEE.std_logic_1164.all;


entity reset_controller_tb is
end entity reset_controller_tb;


architecture structural of reset_controller_tb is

	component reset_controller is
		port (
			pacman_rip			: in	std_logic;	-- Input signal indicating Pac-Man has encountered a ghost.
										--	All output reset signals are set to '1'.
			zero_coins			: in	std_logic;	-- Input signal indicating that all coins have been eaten by Pac-Man,
										--	thus a level reset occurs: set all signals
										--	but the "score_counter_reset" signal to '1'.

			input_controller_reset		: out	std_logic;	-- Output signal for resetting all input controllers
			coin_register_reset		: out	std_logic;	-- Output signal for resetting the coin register
			score_counter_reset		: out	std_logic;	-- Output signal for resetting the score counter
			fsm_reset			: out	std_logic;	-- Output signal for resetting all FSMs
			coordinate_register_reset	: out	std_logic	-- Output signal for restting all coordinate registers
		);
	end component reset_controller;

	signal pacman_rip, zero_coins, input_controller_reset, coin_register_reset,
		score_counter_reset, fsm_reset, coordinate_register_reset : std_logic;

begin

	RC1: reset_controller port map (
						pacman_rip			=> pacman_rip,
						zero_coins			=> zero_coins,
						input_controller_reset		=> input_controller_reset,
						coin_register_reset		=> coin_register_reset,
						score_counter_reset		=> score_counter_reset,
						fsm_reset			=> fsm_reset,
						coordinate_register_reset	=> coordinate_register_reset
				);

	pacman_rip <=	'0' after 0 ns,
			'1' after 10 ns,
			'0' after 30 ns;

	zero_coins <=	'0' after 0 ns,
			'1' after 20 ns,
			'0' after 50 ns;

end architecture structural;