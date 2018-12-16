architecture structural of buffer_1bit is

component d_flipflop_1bit is
	port(
		clk		:in 	std_logic;
		signal_in	:in 	std_logic;
		signal_out	:out	std_logic	
	);
end component d_flipflop_1bit;

signal intermediate : std_logic;

begin
	LBL1:	d_flipflop_1bit port map (
			clk 		=> clk,
			signal_in 	=> input,
			signal_out	=> intermediate
		);
	
	LBL2:	d_flipflop_1bit port map (
			clk 		=> clk,
			signal_in	=> intermediate,
			signal_out	=> output
		);
end structural;
												