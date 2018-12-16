architecture behavioural of d_flipflop_1bit is  
begin
  	process(clk)
		begin	
			if (rising_edge (clk)) then
				signal_out <= signal_in;
		end if;
	end process;
end architecture behavioural;
  
