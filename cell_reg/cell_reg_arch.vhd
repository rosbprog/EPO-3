architecture behavioural of cell_register is
begin

	vc_done_out		<= vc_done_in;
	vc_has_priority		<= not vc_done_in;
	row_number_out		<= row_number_requested;
	column_number_out	<= column_number_requested;

	---------------------------------------------------------------------------------------------------------
	-- cell_state_proc
	-- On input change, calculate the new cell state
	---------------------------------------------------------------------------------------------------------
	cell_state_proc: process(
					coin_present,		wall_present,
					vc_done_in,		score,
					row_number_pacman,	column_number_pacman,
					row_number_ghost1,	column_number_ghost1,
					row_number_ghost2,	column_number_ghost2,
					row_number_requested,	column_number_requested
				)
	begin
		if wall_present = '1' then
			cell_type <= "110";	-- If the cell contains a wall

		elsif (row_number_requested = row_number_pacman) and
				(column_number_requested = column_number_pacman) then
			cell_type <= "001";	-- If the cell contains pacman

		elsif (row_number_requested = row_number_ghost1) and
				(column_number_requested = column_number_ghost1) then
			cell_type <= "010";	-- If the cell contains ghost1

		elsif (row_number_requested = row_number_ghost2) and
				(column_number_requested = column_number_ghost2) then
			cell_type <= "011";	-- If the cell contains ghost2

		elsif coin_present = '1' then
			cell_type <= "101";	-- If the cell contains a coin

		else
			cell_type <= "000";	-- If the cell is empty
		end if;
	end process;

end architecture behavioural;