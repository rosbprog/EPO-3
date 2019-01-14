library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of ghost_struct is

component coordinate_adder is
port (
		row_number_old		: in	std_logic_vector(4 downto 0);	
		column_number_old	: in	std_logic_vector(4 downto 0);	
		move		: in	std_logic_vector(3 downto 0);	
		row_number_new		: out	std_logic_vector(4 downto 0);	
		column_number_new	: out	std_logic_vector(4 downto 0)	
	);
end component;

component coordinate_multiplexer is
port (
		sel			: in std_logic;

		row_number_in1		: in std_logic_vector(4 downto 0);
		column_number_in1	: in std_logic_vector(4 downto 0);

		row_number_in2		: in std_logic_vector(4 downto 0);
		column_number_in2	: in std_logic_vector(4 downto 0);

		row_number_out		: out std_logic_vector(4 downto 0);
		column_number_out	: out std_logic_vector(4 downto 0)
	);
end component;

component coordinate_register is
port (
		clk			: in	std_logic;
		reset			: in	std_logic;	
		row_number_reset	: in	std_logic_vector(4 downto 0);	
		column_number_reset	: in	std_logic_vector(4 downto 0);	
		row_number_in		: in	std_logic_vector(4 downto 0);	
		column_number_in	: in	std_logic_vector(4 downto 0);	
		row_number_out		: out	std_logic_vector(4 downto 0);
		column_number_out	: out	std_logic_vector(4 downto 0)	
	);

end component;

component ghost_cont is
port(clk         : in  std_logic;
        reset       : in  std_logic;
        ghost_start		  : in  std_logic;
        pos_is_wall	: in  std_logic;
        en_cor_ghost   : out std_logic;
        ghost_ready    : out std_logic;
        en_wall     : out std_logic);
end component;

component input_system_ghost is
	port (
		clk		: in	std_logic;
		reset		: in	std_logic;
		start		: in	std_logic;	
		
		dir_ghost	: in	std_logic_vector(2 downto 0);
		dir_out_ghost	: out	std_logic_vector(3 downto 0)	
	);
end component input_system_ghost;


signal data_buffed, move : std_logic_vector(3 downto 0);
signal mux_select : std_logic;
signal row_muxxed, col_muxxed : std_logic_vector(4 downto 0);
signal int_old_row, int_old_col, int_new_row, int_new_col : std_logic_vector (4 downto 0);
signal select_freeze : std_logic;

begin

row_old <= int_old_row;
col_old <= int_old_col;
row_new <= int_new_row;
col_new <= int_new_col;
select_freeze <= mux_select and (not(ghost_freeze));

--L0: input_buffer port map (clk, reset, ghost_input, data_buffed);
--L1: input_controller port map (clk, reset, data_buffed, move);
L5: input_system_ghost port map (clk, reset, start, ghost_input, move);
L2: coordinate_adder port map (int_old_row, int_old_col, move, int_new_row, int_new_col);
L3: coordinate_multiplexer port map (select_freeze, int_old_row, int_old_col, int_new_row, int_new_col, row_muxxed, col_muxxed);
L4: coordinate_register port map (clk, reset, row_reset, col_reset, row_muxxed, col_muxxed, int_old_row, int_old_col);
L5: ghost_cont port map (clk, reset, ghost_start, pos_is_wall, mux_select, ghost_ready, en_wall);

end structural;

