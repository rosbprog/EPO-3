architecture behavioural of counter is
	signal count : unsigned (6 downto 0);
begin
	process(vc_done)
	begin
		if (rising_edge(vc_done)) then
			if (countreset='1') then
				count <= (others=> '0');
			else
				count <=count+1;
			end if;
		end if;
	end process;
	count_out<=std_logic_vector(count);
end architecture behavioural;
 
