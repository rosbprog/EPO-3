architecture structural of input_system_ghost is
	component buffer_3_bit is
		port (
			clk		: in	std_logic;
			reset		: in	std_logic;

			data_in		: in	std_logic_vector(2 downto 0);
			data_out	: out	std_logic_vector(2 downto 0)
		);
	end component buffer_3_bit;
	
	component input_controller_ghost is
		port (
			clk			: in	std_logic;
			reset			: in	std_logic;

			start			: in	std_logic;
			move_in			: in	std_logic_vector(2 downto 0);
			move_out		: out	std_logic_vector(3 downto 0)
		);
	end component input_controller_ghost;
	
	signal buf_int: std_logic_vector(2 downto 0);
begin
	BUF_G: buffer_3_bit port map(
					clk 	=> 	clk,
					reset	=>	reset,
					data_in	=>	dir_ghost,
					data_out=>	buf_int
				);
				
	CON_G: input_controller_ghost port map(
					clk	=> clk,
					reset	=> reset,
					move_in	=> buf_int,
					move_out=> dir_out_ghost,
					start	=> start
				);
end architecture structural;
