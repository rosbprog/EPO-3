architecture structural of speedcontroller is
	component fsm_counter is
		port (	clk		: in	std_logic; --12.5 MHz clock signal
			reset		: in	std_logic; --System reset
		
			p_rdy		: in 	std_logic;
			g1_rdy		: in 	std_logic;
			coin_rst		: in 	std_logic; --reset when all coins picked up
			count		: in 	std_logic_vector(6 downto 0);

			p_strt		: out 	std_logic;
			g1_strt		: out 	std_logic;
			g2_strt		: out 	std_logic;
			c_rst		: out	std_logic  --counter reset
		); 
	end component fsm_counter;

	component register_7bit is
		port(	clk		: in	std_logic;
			count_in		: in	std_logic_vector(6 downto 0);
			c_rst		: in 	std_logic; 
			count_out 		: out 	std_logic_vector(6 downto 0));
	end component register_7bit;

	component multiplexer is
		port(	
		vc_done   : in  std_logic;
        		count_old : in  std_logic_vector(6 downto 0);
        		count_new : in  std_logic_vector(6 downto 0);
        		count     : out std_logic_vector(6 downto 0)
		);
	end component multiplexer;

	component plus_one is
		port(	count_in  : in  std_logic_vector(6 downto 0);
        			count_out : out std_logic_vector(6 downto 0)
		);
	end component plus_one;
	
	signal count_int, count_int2, count_int3	: std_logic_vector(6 downto 0);
	signal c_rst_int				: std_logic;			
	
begin
LBL1: fsm_counter		port map(		
				clk 	=> clk,
				reset 	=> reset,
				p_rdy 	=> p_rdy,
				g1_rdy	=> g_rdy,
				coin_rst=> coin_rst,
				count	=> count_int,

				p_strt	=> p_strt,
				g1_strt	=> g1_strt,
				g2_strt	=> g2_strt,
				c_rst	=> c_rst_int		
			);
LBL2: register_7bit	port map(		
				clk	=> clk,
				count_in=> count_int2,
				c_rst	=> c_rst_int,
				count_out=> count_int
			);

LBL3: multiplexer port map(				
				vc_done	=> vc_done,
				count_old	=> count_int,
				count_new	=> count_int3,
				count	=> count_int2
			);

LBL4: plus_one 		port map(		
				count_in	=> count_int,
				count_out	=> count_int3
			);
end architecture structural;
