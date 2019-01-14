architecture behavioural of d_flip_flop is
begin

	---------------------------------------------------------------------------------------------------------
	-- clk_proc:
	-- On rising edge of the clk signal, put the input through to the output
	---------------------------------------------------------------------------------------------------------
	clk_proc: process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				data_out <= (others => '0');
			else
				data_out <= data_in;
			end if;
		end if;
	end process;

end architecture behavioural;
