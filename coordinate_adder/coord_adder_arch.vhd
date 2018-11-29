architecture behavioural of coordinate_adder is
begin

	---------------------------------------------------------------------------------------------------------
	-- calc_proc:
	-- Calculate the new cell coordinates by moving from the original cell
	---------------------------------------------------------------------------------------------------------
	calc_proc: process(row_number_old, column_number_old)
	begin
		row_number_new 		<= std_logic_vector(unsigned(row_number_old) -
			move(1) + move(3));
		column_number_new 	<= std_logic_vector(unsigned(column_number_old) -
			move(2) + move(0));
	end process;

end architecture behavioural;