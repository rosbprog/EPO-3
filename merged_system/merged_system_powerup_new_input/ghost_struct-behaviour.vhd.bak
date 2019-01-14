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

component input_controller is
port (
		clk			: in	std_logic;
		reset			: in	std_logic;

		move_in			: in	std_logic_vector(3 downto 0);
		move_out		: out	std_logic_vector(3 downto 0)
	);
end component;

component input_buffer is
port (
		clk		: in	std_logic;
		reset		: in	std_logic;

		data_in		: in	std_logic_vector(3 downto 0);
		data_out	: out	std_logic_vector(3 downto 0)
	);
end component;

signal data_buffed, move : std_logic_vector(3 downto 0);
signal mux_select : std_logic;
signal row_muxxed, col_muxxed : std_logic_vector(4 downto 0);

begin

L0: input_buffer port map (clk, reset, ghost_input, data_buffed);
L1: input_controller port map (clk, reset, data_buffed, move);
L2: coordinate_adder port map (row_old, col_old, move, row_new, col_new);
L3: coordinate_multiplexer port map (mux_select, row_old, col_old, row_new, col_new, row_muxxed, col_muxxed);
L4: coordinate_register port map (clk, reset, row_reset, col_reset, row_muxxed, col_muxxed, row_old, col_old);
L5: ghost_cont port map (clk, reset, ghost_start, pos_is_wall, mux_select, ghost_ready, en_wall);

end structural;
