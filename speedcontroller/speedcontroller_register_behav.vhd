architecture behavioural of counter is
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (c_rst = '1') then
				count_out <= (others=> '0');
			else
				count_out <= count_in;
			end if;
		end if;
	end process;
end architecture behavioural;
 
