architecture behavioural of reset_controller is
begin

	coin_register_reset		<= '1' when pacman_rip = '1' or zero_coins = '1' else '0';
	score_counter_reset		<= '1' when pacman_rip = '1' else '0';
	pacman_reset			<= '1' when pacman_rip = '1' else '0';
	ghost1_reset			<= '1' when pacman_rip = '1' else '0';
	ghost2_reset			<= '1' when pacman_rip = '1' else '0';

end architecture behavioural;
