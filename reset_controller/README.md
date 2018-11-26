# reset_controller

This folder contains all files to describe and test the reset controller.

The reset controller is a central controller from where all components are resetted if necessary.  
There are two inputs, namely the "pacman_rip" signal, which is set to '1' when Pac-Man has encountered a ghost (set by the pacman FSM),
and the "zero_coins" signal, which is set to '1' when all coins have been eaten by Pac-Man.

When the "pacman_rip" signal is read as '1', all outgoing reset signals are set to '1'.
The output reset signals are:
- "input_controller_reset"
- "coin_register_reset"
- "score_counter_reset"
- "fsm_reset"
- "coordinate_register_reset"

When the "zero_coins" signal is read as '1', all outgoing reset signals, except for the "score_counter_reset" signal, are set to '1'.
