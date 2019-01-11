architecture behavioural of coordinate_multiplexer is
begin

	row_number_out		<= row_number_in1 when sel = '0' else row_number_in2;
	column_number_out	<= column_number_in1 when sel = '0' else column_number_in2;

end architecture behavioural;
