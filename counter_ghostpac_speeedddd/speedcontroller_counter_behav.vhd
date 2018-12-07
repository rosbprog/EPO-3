architecture behavioural of counter is
	signal count : unsigned (6 downto 0);
begin
	process(vc_done)
	begin
			if (c_rst='1') then
				count <= (others=> '0');
			elsif (rising_edge(vc_done)) then
				count <=count+1;
			else
				count <= count;
			end if;
		end if;
	end process;
	count_out<=std_logic_vector(count);
end architecture behavioural;
 
