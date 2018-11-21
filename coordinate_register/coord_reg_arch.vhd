architecture behavioural of coordinate_register is
begin

	---------------------------------------------------------------------------------------------------------
	-- clk_proc:
	-- On rising edge of the clk signal, go to the next state
	---------------------------------------------------------------------------------------------------------
	clk_proc: process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				row_number_out		<= row_number_reset;
				column_number_out	<= column_number_reset;
			else
				row_number_out		<= row_number_in;
				column_number_out	<= column_number_in;
			end if;
		end if;
	end process;

end architecture behavioural;