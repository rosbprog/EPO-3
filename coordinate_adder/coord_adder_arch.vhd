architecture behavioural of coordinate_adder is
begin

	---------------------------------------------------------------------------------------------------------
	-- clk_slow_proc:
	-- On rising edge of the "clk_slow" signal, calculate the new cell coordinates
	--	by moving from the original cell
	---------------------------------------------------------------------------------------------------------
	clk_slow_proc: process(clk_slow)
	begin
		if rising_edge(clk_slow) then
			row_number_new 		<= std_logic_vector(unsigned(row_number_old) -
				move(1) + move(3));
			column_number_new 	<= std_logic_vector(unsigned(column_number_old) -
				move(2) + move(0));
		end if;
	end process;

end architecture behavioural;