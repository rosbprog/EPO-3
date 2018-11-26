architecture behavioural of reset_controller is
begin

	input_controller_reset		<= '1' when pacman_rip = '1' or zero_coins = '1' else '0';
	coin_register_reset		<= '1' when pacman_rip = '1' or zero_coins = '1' else '0';
	score_counter_reset		<= '1' when pacman_rip = '1' else '0';
	fsm_reset			<= '1' when pacman_rip = '1' or zero_coins = '1' else '0';
	coordinate_register_reset	<= '1' when pacman_rip = '1' or zero_coins = '1' else '0';

end architecture behavioural;