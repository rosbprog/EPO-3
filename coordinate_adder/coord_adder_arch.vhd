architecture behavioural_case of coordinate_adder is
begin

	---------------------------------------------------------------------------------------------------------
	-- calc_proc:
	-- Calculate the new cell coordinates by moving from the original cell
	---------------------------------------------------------------------------------------------------------
	calc_proc: process(row_number_old, column_number_old)
	begin
<<<<<<< HEAD
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
=======
		row_number_new 		<= std_logic_vector(unsigned(row_number_old) -
			move(1) + move(3));
		column_number_new 	<= std_logic_vector(unsigned(column_number_old) -
			move(2) + move(0));
>>>>>>> 40ed300e268dd9fdd2f52537d9708782f48b1458
	end process;

end architecture behavioural_case;