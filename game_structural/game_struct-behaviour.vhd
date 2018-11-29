library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of game_struct is

-- Below are all components of the game-part listed, these are (11 in total):
-- cell_register, coin_register, coordinate_adder, coordinate_comparator,
-- coordinate_multiplexer, coordinate_register, map_register,
-- reset_controller, row_controller, score_counter.

component cell_register is
	port (
		coin_present		        : in std_logic;		
		wall_present	          	: in std_logic;		
		vc_done_in		        : in std_logic;	
		score_add_in			: in std_logic;
		score_reset_in			: in std_logic;	
		row_number_pacman	      : in std_logic_vector(4 downto 0);	
		column_number_pacman	   : in std_logic_vector(4 downto 0);	
		row_number_ghost1	      : in std_logic_vector(4 downto 0);
		column_number_ghost1	   : in std_logic_vector(4 downto 0);	
		row_number_ghost2	      : in std_logic_vector(4 downto 0);	
		column_number_ghost2	   : in std_logic_vector(4 downto 0);	
		row_number_requested	   : in std_logic_vector(4 downto 0);	
		column_number_requested	: in std_logic_vector(4 downto 0);	
		row_number_out		        : out std_logic_vector(4 downto 0);	
		column_number_out      	: out std_logic_vector(4 downto 0);	
		cell_type		        : out std_logic_vector(2 downto 0);	
		vc_done_out		        : out std_logic;	
		vc_has_priority		       : out std_logic;
		score_add_out			: out std_logic;
		score_reset_out			: out std_logic
	);
end component;

component coin_register is
 port(clk            : in  std_logic;
        reset        : in  std_logic;
	write_coin   : in  std_logic;
        row          : in  std_logic_vector(4 downto 0);
        column       : in  std_logic_vector(4 downto 0);
        coin_present : out std_logic;
	score_add 	  : out std_logic;
	zero_coins   : out std_logic);
end component;

component coordinate_adder is
port (
		row_number_old	  	: in	std_logic_vector(4 downto 0);
		column_number_old	: in	std_logic_vector(4 downto 0);	
		move		  : in	std_logic_vector(3 downto 0);
		row_number_new		  : out	std_logic_vector(4 downto 0);	
		column_number_new	: out	std_logic_vector(4 downto 0)
	);
end component;


component coordinate_comparator is
port (
		row_number1	   : in	std_logic_vector(4 downto 0);	
		column_number1	: in	std_logic_vector(4 downto 0);		
		row_number2	   : in	std_logic_vector(4 downto 0);	
		column_number2	: in	std_logic_vector(4 downto 0);	
		is_equal	      : out	std_logic	
	);
end component;

component coordinate_multiplexer is
port (
		sel		  : in std_logic;
		row_number_in1		  : in std_logic_vector(4 downto 0);
		column_number_in1	: in std_logic_vector(4 downto 0);
		row_number_in2		  : in std_logic_vector(4 downto 0);
		column_number_in2	: in std_logic_vector(4 downto 0);
		row_number_out		  : out std_logic_vector(4 downto 0);
		column_number_out	: out std_logic_vector(4 downto 0)
	);
end component;

component coordinate_register is
port (
		clk		    : in	std_logic;	
		reset		    : in	std_logic;	
		row_number_reset	   : in	std_logic_vector(4 downto 0);
		column_number_reset	: in	std_logic_vector(4 downto 0);
		row_number_in	     	: in	std_logic_vector(4 downto 0);	
		column_number_in	   : in	std_logic_vector(4 downto 0);	
		row_number_out		    : out	std_logic_vector(4 downto 0);	
		column_number_out	  : out	std_logic_vector(4 downto 0)	
	);
end component;

component fsm_counter is
port (	clk 	: in	std_logic;
	reset	: in	std_logic;
	p_rdy	: in 	std_logic;
	g1_rdy	: in 	std_logic;
	coin_rst	: in 	std_logic; 
	count	: in 	std_logic_vector(6 downto 0);
	p_strt	: out 	std_logic;
	g1_strt	: out 	std_logic;
	g2_strt	: out 	std_logic;
	c_rst	: out	std_logic);
end component;

component counter is
port(	vc_done	   : in	std_logic;
	countreset	: in	std_logic; 
	count_out 	: out std_logic_vector(6 downto 0));
end component;

component input_system is
port (
		clk        	: in	std_logic;
		reset      	: in	std_logic;
		data_input	 : in	std_logic_vector(3 downto 0);
		data_output	: out	std_logic_vector(3 downto 0)
	);
end component;

component map_register is
port (
		row_select	   : in 	std_logic_vector(4 downto 0);	
		column_select	: in 	std_logic_vector(4 downto 0);	
		cell_value	   : out	std_logic	
	);
end component;

component reset_controller is
port (
		pacman_rip			  : in	std_logic;	
		zero_coins		  	  : in	std_logic;	
		input_controller_reset		  : out	std_logic;	
		coin_register_reset		     : out	std_logic;	
		score_counter_reset		     : out	std_logic;	
		fsm_reset			  : out	std_logic;	
		coordinate_register_reset	: out	std_logic	
);
end component;

-- This signal is used for the OR-operation after the coordinate_comparators
signal sadness : std_logic;
-- The signals used for the cell_register:
signal coin_present, wall_present, vc_done_out, vc_has_priority : std_logic;
signal score : std_logic_vector (9 downto 0);
signal row_number_pacman, column_number_pacman, row_number_ghost1, column_number_ghost1, row_number_ghost2, column_number_ghost2, row_number_out, column_number_out : std_logic_vector (4 downto 0);
-- The signals used for the coin_register:
signal coin_reset, write_coin, score_add_in, score_add_out, zero_coins: std_logic;
signal coin_row, coin_column : std_logic_vector (4 downto 0);
-- The signals used for the coordinate_comparators:
signal row_new_p, col_new_p, row_new_g1, col_new_g1, row_new_g2, col_new_g2 : std_logic_vector (4 downto 0);
signal c_g1, c_g2 : std_logic;
-- The signals used for the coordinate_adders:
signal dir_out_p, dir_out_g1, dir_out_g2 : std_logic_vector (3 downto 0);
-- The signals used for the coordinate multiplexers:
signal en_cor_p, en_cor_g1, en_cor_g2 : std_logic;
signal row_old_p, col_old_p, row_def_p, col_def_p, row_old_g1, col_old_g1, row_def_g1, col_def_g1, row_old_g2, col_old_g2, row_def_g2, col_def_g2 : std_logic_vector (4 downto 0);
-- The signals used for the coordinate registers: 
signal row_number_reset_p, column_number_reset_p, row_number_reset_g1, column_number_reset_g1, row_number_reset_g2, column_number_reset_g2 : std_logic_vector (4 downto 0);
-- The signals used for the FSM counter:
signal countreset : std_logic;
signal fsm_count : std_logic_vector (6 downto 0);
signal p_ready, g1_ready, p_start, g1_start, g2_start, fsm_count_reset : std_logic;
-- The signals used for the map_register:
signal row_select, column_select : std_logic_vector (4 downto 0);
-- The signals used for the map_multiplexers:
signal row_int_mux, col_int_mux, row_int_mux2, col_int_mux2 : std_logic_vector (4 downto 0);  -- sorry voor de verwarrende namen hiervan
signal en_wall_g, en_wall_p : std_logic; -- the letter g or p indicates from which FSM the signal comes
-- The signals used for the reset_controller:
signal reset_in, fsm_reset, coordinate_reg_reset, score_reset_in, score_reset_out : std_logic;

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- Here we GOOOOOOOOOOOOOOOOOOOOOOOOOOOooooooooooooooooooooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOooooooooooooooooooooooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOooooooooooooooooooooo
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
begin

-- Implementing the OR-gate for the sadness-signal:
Coordinate_OR: sadness <= c_g1 OR c_g2;
-- declaration for row_number_reset_p, column_number_reset_p, and for g1 and g2 as well:
row_number_reset_p <= "10011"; column_number_reset_p <= "01100";
row_number_reset_g1 <= "01100"; column_number_reset_g1 <= "01100";
row_number_reset_g2 <= "01101"; column_number_reset_g2 <= "01101";

-- Below come the portmaps to interconnect the components:

Cell_reg: cell_register port map(coin_present, wall_present, vc_done_in, score_add_in, score_reset_in, row_old_p, col_old_p, row_old_g1, col_old_g1, row_old_g2, col_old_g2, row_number_requested, column_number_requested, row_number_out, column_number_out, cell_type, vc_done_out, vc_has_priority, score_add, score_reset);

Coin_reg: coin_register port map(clk, coin_reset, write_coin, coin_row, coin_column, coin_present, score_add_in, zero_coins);
Coin_mux: coordinate_multiplexer port map(vc_has_priority, row_new_p, col_new_p, row_number_out, column_number_out, coin_row, coin_column);

Co_adder_pacman: coordinate_adder port map(row_old_p, col_old_p, dir_out_p, row_new_p, col_new_p);
Co_adder_ghost1: coordinate_adder port map(row_old_g1, col_old_g1, dir_out_g1, row_new_g1, col_new_g1);
Co_adder_ghost2: coordinate_adder port map(row_old_g2, col_old_g2, dir_out_g2, row_new_g2, col_new_g2);
Co_comp_ghost1: coordinate_comparator port map(row_new_p, col_new_p, row_new_g1, col_new_g1, c_g1);
Co_comp_ghost2: coordinate_comparator port map(row_new_p, col_new_p, row_new_g2, col_new_g2, c_g2);
Co_mux_pacman: coordinate_multiplexer port map(en_cor_p, row_old_p, col_old_p, row_new_p, col_new_p, row_def_p, col_def_p);
Co_mux_ghost1: coordinate_multiplexer port map(en_cor_g1, row_old_g1, col_old_g1, row_new_g1, col_new_g1, row_def_g1, col_def_g1);
Co_mux_ghost2: coordinate_multiplexer port map(en_cor_g2, row_old_g2, col_old_g2, row_new_g2, col_new_g2, row_def_g2, col_def_g2);
Co_reg_pacman: coordinate_register port map(clk, coordinate_reg_reset, row_number_reset_p, column_number_reset_p, row_def_p, col_def_p, row_old_p, col_old_p);
Co_reg_ghost1: coordinate_register port map(clk, coordinate_reg_reset, row_number_reset_g1, column_number_reset_g1, row_def_g1, col_def_g1, row_old_g1, col_old_g1);
Co_reg_ghost2: coordinate_register port map(clk, coordinate_reg_reset, row_number_reset_g2, column_number_reset_g2, row_def_g2, col_def_g2, row_old_g2, col_old_g2);

Counter_lbl: counter port map(vc_done_out, fsm_count_reset, fsm_count);
Counter_fsm: fsm_counter port map(clk, fsm_reset, p_ready, g1_ready, coin_reset, fsm_count, p_start, g1_start, g2_start, fsm_count_reset);

In_sys_pacman: input_system port map(clk, reset_in, dir_in_p, dir_out_p);
In_sys_ghost1: input_system port map(clk, reset_in, dir_in_g1, dir_out_g1);
In_sys_ghost2: input_system port map(clk, reset_in, dir_in_g2, dir_out_g2);

Map_reg: map_register port map(row_select, column_select, wall_present);
Map_mux_1: coordinate_multiplexer port map(vc_has_priority, row_int_mux, col_int_mux, row_number_out, column_number_out, row_select, column_select); -- the mux closest to the map_reg
Map_mux_2: coordinate_multiplexer port map(en_wall_g, row_new_g2, col_new_g2, row_int_mux2, col_int_mux2, row_int_mux, col_int_mux); -- the mux below
Map_mux_3: coordinate_multiplexer port map(en_wall_p, row_new_g1, col_new_g1, row_new_p, col_new_p, row_int_mux2, col_int_mux2); -- the mux above

Reset_control: reset_controller port map(sadness, zero_coins, reset_in, coin_reset, score_reset_in, fsm_reset, coordinate_reg_reset);


end behaviour;

