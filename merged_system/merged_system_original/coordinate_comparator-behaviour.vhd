architecture behavioural of coordinate_comparator is
begin

	-- Set "is_equal" to '1' when both the "row"-busses
	--	and both "column"-busses are equal, otherwise set to '0'
	is_equal <= '1' when (row_number1 = row_number2)
			and (column_number1 = column_number2) else '0';

end architecture behavioural;
