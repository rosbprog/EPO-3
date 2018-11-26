library IEEE;
use IEEE.std_logic_1164.all;


entity reset_controller is
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
end entity reset_controller;