library IEEE;
use IEEE.std_logic_1164.all;


entity reset_controller is
	port (
		pacman_rip			: in	std_logic;	-- Input signal indicating Pac-Man has encountered a ghost.
									--	All output reset signals are set to '1'.
		zero_coins			: in	std_logic;	-- Input signal indicating that all coins have been eaten by Pac-Man,
									--	thus a level reset occurs: set all signals
									--	but the "score_counter_reset" signal to '1'.

		coin_register_reset		: out	std_logic;	-- Output signal for resetting the coin register
		score_counter_reset		: out	std_logic;	-- Output signal for resetting the score counter
		pacman_reset			: out	std_logic;	-- Output signal for resetting the pacman system
		ghost1_reset			: out	std_logic;	-- Output signal for resetting the ghost1 system
		ghost2_reset			: out	std_logic	-- Output signal for resetting the ghost2 system
	);
end entity reset_controller;
