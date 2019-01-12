architecture structural of input_system is
	component buffer_3_bit is
		port (
			clk		: in	std_logic;
			reset		: in	std_logic;

			data_in		: in	std_logic_vector(2 downto 0);
			data_out	: out	std_logic_vector(2 downto 0)
		);
	end component buffer_3_bit;

	component input_controller_pacman is
		port (
			clk			: in	std_logic;
			reset			: in	std_logic;
	
			move_in			: in	std_logic_vector(2 downto 0);
			move_out		: out	std_logic_vector(3 downto 0);
			start			: out	std_logic
		);
	end component input_controller_pacman;

	
	component input_controller_ghost is
		port (
			clk			: in	std_logic;
			reset			: in	std_logic;

			start			: in	std_logic;
			move_in			: in	std_logic_vector(2 downto 0);
			move_out		: out	std_logic_vector(3 downto 0)
		);
	end component input_controller_ghost;
	
	signal start_int	: std_logic;
	signal buf_p_int, buf_g1_int, buf_g2_int : std_logic_vector(2 downto 0);
begin
	BUF_P: buffer_3_bit port map(
					clk 	=> 	clk,
					reset	=>	reset,
					data_in	=>	dir_pacman,
					data_out=>	buf_p_int
				);
	BUF_G1: buffer_3_bit port map(
					clk 	=> 	clk,
					reset	=>	reset,
					data_in	=>	dir_ghost1,
					data_out=>	buf_g1_int
				);
	BUF_G2: buffer_3_bit port map(
					clk 	=> 	clk,
					reset	=>	reset,
					data_in	=>	dir_ghost2,
					data_out=>	buf_g2_int
				);
					
	CON_P: input_controller_pacman port map(
					clk	=> clk,
					reset	=> reset,
					move_in	=> buf_p_int,
					move_out=> dir_out_p1,
					start	=> start_int
				);					
	CON_G1: input_controller_ghost port map(
					clk	=> clk,
					reset	=> reset,
					move_in	=> buf_g1_int,
					move_out=> dir_out_p2,
					start	=> start_int
				);
	CON_G2: input_controller_ghost port map(
					clk	=> clk,
					reset	=> reset,
					move_in	=> buf_g2_int,
					move_out=> dir_out_p3,
					start	=> start_int
				);					
	start <= start_int;				

end architecture structural;
