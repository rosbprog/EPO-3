architecture structural of speedcontroller is
	component fsm_counter is
		port (	clk		: in	std_logic; --12.5 MHz clock signal
			reset		: in	std_logic; --System reset
		
			p_rdy		: in 	std_logic;
			g1_rdy		: in 	std_logic;
			coin_rst	: in 	std_logic; --reset when all coins picked up
			count		: in 	std_logic_vector(6 downto 0);

			p_strt		: out 	std_logic;
			g1_strt		: out 	std_logic;
			g2_strt		: out 	std_logic;
			c_rst		: out	std_logic); --counter reset
	end component fsm_counter;

	component counter is
		port(	vc_done		: in	std_logic;
			c_rst		: in 	std_logic; 
			count_out 	: out 	std_logic_vector(6 downto 0));
	end component counter;

	signal c_rst_intern		: std_logic;
	signal count_intern		: std_logic_vector(6 downto 0);

begin
	IB1: fsm_counter port map (
		clk		=> clk,
		reset		=> reset,
	
		p_rdy		=> p_rdy,
		g1_rdy		=> g_rdy,
		coin_rst	=> coin_rst,
		count		=> count_intern,
		
		p_strt		=> p_strt,
		g1_strt		=> g1_strt,
		g2_strt		=> g2_strt,
		c_rst		=> c_rst_intern
	);
	
	IB2: counter port map (
		vc_done 	=> vc_done,
		c_rst		=> c_rst_intern,
		count_out	=> count_intern
	);
end architecture structural;
