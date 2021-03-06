library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of game_struct is

  component cell_register is
  port (		coin_present		: in std_logic;				
		wall_present		: in std_logic;				
		vc_done_in		: in std_logic;				
		score_pulse_in		: in std_logic;				
		score_reset_in		: in std_logic;				
		is_game_over_in		: in std_logic;				
		row_number_pacman	: in std_logic_vector(4 downto 0);	
		column_number_pacman	: in std_logic_vector(4 downto 0);	
		row_number_ghost1	: in std_logic_vector(4 downto 0);	
		column_number_ghost1	: in std_logic_vector(4 downto 0);	
		row_number_ghost2	: in std_logic_vector(4 downto 0);	
		column_number_ghost2	: in std_logic_vector(4 downto 0);	
		row_number_requested	: in std_logic_vector(4 downto 0);	
		column_number_requested	: in std_logic_vector(4 downto 0);	
		row_number_out		: out std_logic_vector(4 downto 0);	
		column_number_out	: out std_logic_vector(4 downto 0);	
		cell_type		: out std_logic_vector(2 downto 0);	
		vc_done_out		: out std_logic;			
		vc_has_priority		: out std_logic;			
		score_pulse_out		: out std_logic;			
		score_reset_out		: out std_logic;			
		is_game_over_out	: out std_logic);
  end component;

  component coin_register is
  port(clk          : in  std_logic;
        reset        : in  std_logic;
	write_coin   : in  std_logic;
        row          : in  std_logic_vector(4 downto 0);
        column       : in  std_logic_vector(4 downto 0);
        coin_present : out std_logic;
	score_add    : out std_logic;
	zero_coins   : out std_logic);
  end component; 

  component coordinate_multiplexer is
  port (		sel			: in std_logic;
		row_number_in1		: in std_logic_vector(4 downto 0);
		column_number_in1	: in std_logic_vector(4 downto 0);
		row_number_in2		: in std_logic_vector(4 downto 0);
		column_number_in2	: in std_logic_vector(4 downto 0);
		row_number_out		: out std_logic_vector(4 downto 0);
		column_number_out	: out std_logic_vector(4 downto 0));
  end component;

  component deathcontroller is
  port (		col_new_p	: in 	std_logic_vector(4 downto 0);
		row_new_p	: in	std_logic_vector(4 downto 0);	
		col_old_g1	: in	std_logic_vector(4 downto 0);
		row_old_g1	: in 	std_logic_vector(4 downto 0);
		col_old_g2	: in	std_logic_vector(4 downto 0);
		row_old_g2	: in 	std_logic_vector(4 downto 0);
		sadness		: out 	std_logic);
  end component;

  component ghost_struct is
  port(clk         : in  std_logic;
        reset       : in  std_logic;
        pos_is_wall : in  std_logic;
        ghost_start : in  std_logic;
        ghost_input : in  std_logic_vector(3 downto 0);
        row_old     : out std_logic_vector(4 downto 0);
        col_old     : out std_logic_vector(4 downto 0);
        row_new     : out std_logic_vector(4 downto 0);
        col_new     : out std_logic_vector(4 downto 0);
	row_reset	  : in std_logic_vector(4 downto 0);
	col_reset   : in std_logic_vector(4 downto 0);
        en_wall     : out std_logic;
	ghost_ready	: out std_logic);
  end component;

  component map_register is
  port (		row_select	: in 	std_logic_vector(4 downto 0);
		column_select	: in 	std_logic_vector(4 downto 0);	
		wall_present	: out	std_logic);
  end component;

  component pacman_system is
  port (		clk			: in	std_logic;
		reset			: in	std_logic;
		row_number_old		: out	std_logic_vector(4 downto 0);
		column_number_old	: out	std_logic_vector(4 downto 0);
		row_number_new		: out	std_logic_vector(4 downto 0);
		column_number_new	: out	std_logic_vector(4 downto 0);
		row_number_reset	: in	std_logic_vector(4 downto 0);
		column_number_reset	: in	std_logic_vector(4 downto 0);
		dir_in			: in	std_logic_vector(3 downto 0);
		start			: in	std_logic;
		wall_present		: in	std_logic;
		ghost_present		: in	std_logic;
		rip			: out	std_logic;
		ready			: out	std_logic;
		write_coin		: out	std_logic;
		en_wall			: out	std_logic);
  end component;

  component pulse_generator is
  port (		clk		: in std_logic;
		reset		: in std_logic;
		input_signal	: in std_logic;
		pulse		: out std_logic);
  end component;

  component reset_controller is
  port (		pacman_rip			: in	std_logic;
		zero_coins			: in	std_logic;	
		coin_register_reset		: out	std_logic;	
		score_counter_reset : out std_logic;
		pacman_reset			: out	std_logic;	
		ghost1_reset			: out	std_logic;	
		ghost2_reset			: out	std_logic);
  end component;

  component speedcontroller is
  port (		clk		: in	std_logic;
		reset		: in	std_logic;
		p_rdy		: in 	std_logic;
		g_rdy		: in 	std_logic;
		coin_rst	: in 	std_logic;
		vc_done		: in	std_logic;
		p_strt		: out	std_logic;
		g1_strt		: out 	std_logic;
		g2_strt		: out	std_logic);
  end component;

  -- The following signals do not need to be declared (as they are part of the game_struct entity):
  -- clk, reset, vc_done_in, score_pulse, score_reset : std_logic;
  -- dir_pacman, dir_ghost1, dir_ghost2 : std_logic_vector (3 downto 0);
  -- cell_type : std_logic_vector (2 downto 0);
  -- row_request, col_request : std_logic_vector (4 downto 0);

  -- The following signals are internal signals:
  signal row_reset_pacman, col_reset_pacman, row_reset_ghost1, col_reset_ghost1, row_reset_ghost2, col_reset_ghost2 : std_logic_vector(4 downto 0);
  signal coin_present, write_coin, score_add, zero_coins : std_logic;
  signal row_coin, col_coin : std_logic_vector (4 downto 0);

  signal pacman_dead : std_logic;

  signal row_map, col_map, row_request_int, col_request_int : std_logic_vector (4 downto 0);
  signal row_int_a_to_b, col_int_a_to_b, row_int_b_to_c, col_int_b_to_c : std_logic_vector (4 downto 0);
  signal pos_is_wall, pacman_map_select, ghost1_map_select, vc_has_priority : std_logic;

  signal row_new_pacman, col_new_pacman, row_new_ghost1, col_new_ghost1, row_new_ghost2, col_new_ghost2 : std_logic_vector (4 downto 0);
  signal row_old_pacman, col_old_pacman, row_old_ghost1, col_old_ghost1, row_old_ghost2, col_old_ghost2 : std_logic_vector (4 downto 0);

  signal reset_int, pacman_rip, input_controller_reset, coin_register_reset, score_counter_reset, fsm_reset, coordinate_register_reset : std_logic;

  signal wall_present, score_reset, vc_done, ghost1_reset, ghost1_start, ghost1_ready, ghost2_reset, ghost2_start, ghost2_ready, ghost2_map_select, pacman_start, game_over, pacman_ready, pacman_reset, vc_done_pulse : std_logic;

begin

Label_row_reset_p:        row_reset_pacman  <= "10010";
Label_col_reset_p:        col_reset_pacman  <= "01011";
Label_row_reset_g1:        row_reset_ghost1  <= "01011";
Label_col_reset_g1:        col_reset_ghost1  <= "01011";
Label_row_reset_g2:        row_reset_ghost2  <= "01100";
Label_col_reset_g2:        col_reset_ghost2  <= "01100";

Label_reset:        reset_int <= reset or pacman_dead;

L0: cell_register port map (coin_present, pos_is_wall, vc_done_in, score_add, score_reset, game_over, row_old_pacman, col_old_pacman, row_old_ghost1, col_old_ghost1, row_old_ghost2, col_old_ghost2, row_request, col_request, row_request_int, col_request_int, cell_type, vc_done, vc_has_priority, score_pulse, score_reset_out, game_over_out);

L1a: coin_register port map (clk, coin_register_reset, write_coin, row_coin, col_coin, coin_present, score_add, zero_coins);
L1b: coordinate_multiplexer port map (vc_has_priority, row_new_pacman, col_new_pacman, row_request_int, col_request_int, row_coin, col_coin);

L2: deathcontroller port map (row_new_pacman, col_new_pacman, row_old_ghost1, col_old_ghost1, row_old_ghost2, col_old_ghost2, game_over);

L3a: ghost_struct port map (clk, ghost1_reset, pos_is_wall, ghost1_start, dir_ghost1, row_old_ghost1, col_old_ghost1, row_new_ghost1, col_new_ghost1, row_reset_ghost1, col_reset_ghost1, ghost1_map_select, ghost1_ready);
L3b: ghost_struct port map (clk, ghost2_reset, pos_is_wall, ghost2_start, dir_ghost2, row_old_ghost2, col_old_ghost2, row_new_ghost2, col_new_ghost2, row_reset_ghost2, col_reset_ghost2, ghost2_map_select, ghost2_ready);
L3c: pacman_system port map (clk, pacman_reset, row_old_pacman, col_old_pacman, row_new_pacman, col_new_pacman, row_reset_pacman, col_reset_pacman, dir_pacman, pacman_start, pos_is_wall, pacman_dead, game_over, pacman_ready, write_coin, pacman_map_select);

L4a: map_register port map (row_map, col_map, pos_is_wall);
L4b: coordinate_multiplexer port map (pacman_map_select, row_new_ghost1, col_new_ghost1, row_new_pacman, col_new_pacman, row_int_a_to_b, col_int_a_to_b);
L4c: coordinate_multiplexer port map (ghost1_map_select, row_new_ghost2, col_new_ghost2, row_int_a_to_b, col_int_a_to_b, row_int_b_to_c, col_int_b_to_c);
L4d: coordinate_multiplexer port map (vc_has_priority, row_int_b_to_c, col_int_b_to_c, row_request_int, col_request_int, row_map, col_map);

L5: reset_controller port map (reset_int, zero_coins, coin_register_reset, score_reset, pacman_reset, ghost1_reset, ghost2_reset);

L6a: speedcontroller port map (clk, reset, pacman_ready, ghost1_ready, coin_register_reset, vc_done_pulse, pacman_start, ghost1_start, ghost2_start);
L6b: pulse_generator port map (clk, reset, vc_done, vc_done_pulse);

end structural;

