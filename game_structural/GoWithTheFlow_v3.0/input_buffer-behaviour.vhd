architecture structural of input_buffer is

	component d_flip_flop is
		port (
			clk		: in	std_logic;
			reset		: in	std_logic;

			data_in		: in	std_logic_vector(4 downto 0);
			data_out	: out	std_logic_vector(4 downto 0)
		);
	end component d_flip_flop;

	signal data_intermediate	: std_logic_vector(4 downto 0);

begin

	FF1: d_flip_flop port map (
					clk		=> clk,
					reset		=> reset,
					data_in		=> data_in,
					data_out	=> data_intermediate
				);

	FF2: d_flip_flop port map (
					clk		=> clk,
					reset		=> reset,
					data_in		=> data_intermediate,
					data_out	=> data_out
				);

end architecture structural;
