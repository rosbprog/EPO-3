architecture structural of input_system is

	component input_buffer is
		port (
			clk		: in	std_logic;
			reset		: in	std_logic;

			data_in		: in	std_logic_vector(4 downto 0);
			data_out	: out	std_logic_vector(4 downto 0)
		);
	end component input_buffer;

	component input_controller is
		port (
			clk			: in	std_logic;
			reset			: in	std_logic;

			move_in			: in	std_logic_vector(3 downto 0);
			move_out		: out	std_logic_vector(3 downto 0)
		);
	end component input_controller;

	signal total_data_intermediate	: std_logic_vector(4 downto 0);
	signal data_intermediate	: std_logic_vector(3 downto 0);

begin

	data_intermediate	<= total_data_intermediate(3 downto 0);
	enter_button		<= total_data_intermediate(4);

	IB1: input_buffer port map (
					clk		=> clk,
					reset		=> reset,
					data_in		=> data_input,
					data_out	=> total_data_intermediate
				);

	IC1: input_controller port map (
						clk		=> clk,
						reset		=> reset,
						move_in		=> data_intermediate,
						move_out	=> data_output
					);

end architecture structural;
