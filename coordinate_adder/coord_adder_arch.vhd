architecture behavioural of coordinate_adder is
begin

	---------------------------------------------------------------------------------------------------------
	-- calc_proc:
	-- Calculate the new cell coordinates by moving from the original cell
	---------------------------------------------------------------------------------------------------------
	calc_proc: process(row_number_old, column_number_old, move)
	begin
		case move is
			when "0001" =>
				row_number_new		<= row_number_old;
				column_number_new	<= std_logic_vector(unsigned(column_number_old) + 1);
			when "0010" =>
				row_number_new		<= std_logic_vector(unsigned(row_number_old) - 1);
				column_number_new	<= column_number_old;
			when "0100" =>
				row_number_new		<= row_number_old;
				column_number_new	<= std_logic_vector(unsigned(column_number_old) - 1);
			when "1000" =>
				row_number_new		<= std_logic_vector(unsigned(row_number_old) + 1);
				column_number_new	<= column_number_old;
			when others =>
				row_number_new		<= row_number_old;
				column_number_new	<= column_number_old;
		end case;
	end process;

end architecture behavioural;
