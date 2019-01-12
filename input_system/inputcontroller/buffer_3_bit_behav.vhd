architecture structural of buffer_3_bit is
	component register_3_bit is
		port (
			clk		: in	std_logic;
			reset		: in	std_logic;

			data_in		: in	std_logic_vector(2 downto 0);
			data_out	: out	std_logic_vector(2 downto 0)
		);
	end component register_3_bit;
	signal data_intermediate	: std_logic_vector(2 downto 0);
begin
	FF1: register_3_bit port map (
					clk		=> clk,
					reset		=> reset,
					data_in		=> data_in,
					data_out	=> data_intermediate
				);

	FF2: register_3_bit port map (
					clk		=> clk,
					reset		=> reset,
					data_in		=> data_intermediate,
					data_out	=> data_out
				);

end architecture structural;
