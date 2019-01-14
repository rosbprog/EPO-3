architecture structural of pacman_system is

	component pacman_cont is
   		port(
			p_start     : in  std_logic;
		        pos_is_wall : in  std_logic;
		        sadness     : in  std_logic;
		        clk         : in  std_logic;
		        reset       : in  std_logic;
		        p_ready     : out std_logic;
		        write_coin  : out std_logic;
		        en_wall     : out std_logic;
		        rip         : out std_logic;
		        en_cor      : out std_logic
		);
	end component pacman_cont;

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
	end component coordinate_multiplexer;

	component coordinate_adder is
		port (
			row_number_old		: in	std_logic_vector(4 downto 0);	-- Input bus representing the row number of the original cell
			column_number_old	: in	std_logic_vector(4 downto 0);	-- Input bus representing the column number of the original cell
			move			: in	std_logic_vector(3 downto 0);	-- Input bus representing the movement direction to the new cell:
											--	"0001" = right;
											--	"0010" = up;
											--	"0100" = left;
											--	"1000" = down;

			row_number_new		: out	std_logic_vector(4 downto 0);	-- Output bus representing the row number of the new cell
											--	after moving from the original cell
			column_number_new	: out	std_logic_vector(4 downto 0)	-- Output bus representing the column number of the new cell
											--	after moving from the original cell
		);
	end component coordinate_adder;

	component coordinate_register is
		port (
			clk			: in	std_logic;			-- System clock (12.5 MHz assumed)
			reset			: in	std_logic;			-- System reset

			row_number_reset	: in	std_logic_vector(4 downto 0);	-- Input bus representing the reset (default) row number
			column_number_reset	: in	std_logic_vector(4 downto 0);	-- Input bus representing the reset (default) column number

			row_number_in		: in	std_logic_vector(4 downto 0);	-- Input bus representing the new row number
			column_number_in	: in	std_logic_vector(4 downto 0);	-- Input bus representing the new column number

			row_number_out		: out	std_logic_vector(4 downto 0);	-- Output bus representing the currently stored row number
			column_number_out	: out	std_logic_vector(4 downto 0)	-- Output bus representing the currently stored column number
		);
	end component coordinate_register;

	component input_system is
		port (
			clk		: in	std_logic;
			reset		: in	std_logic;

			data_input	: in	std_logic_vector(3 downto 0);
			data_output	: out	std_logic_vector(3 downto 0)
		);
	end component input_system;

	signal en_new_coord	: std_logic;
	signal move		: std_logic_vector(3 downto 0);
	signal row_number_muxxed, column_number_muxxed	: std_logic_vector(4 downto 0);

begin

	PC1: pacman_cont	port map (
						clk		=> clk,
						reset		=> reset,
						p_start		=> start,
						pos_is_wall	=> wall_present,
						sadness		=> ghost_present,
						p_ready		=> ready,
						write_coin	=> write_coin,
						en_wall		=> en_wall,
						rip		=> rip,
						en_cor		=> en_new_coord
					);

	CM1: coordinate_multiplexer	port map (
							sel			=> en_new_coord,
							row_number_in1		=> row_number_old,
							column_number_in1	=> column_number_old,
							row_number_in2		=> row_number_new,
							column_number_in2	=> column_number_new,
							row_number_out		=> row_number_muxxed,
							column_number_out	=> column_number_muxxed
						);

	CA1: coordinate_adder	port map (
						move			=> move,
						row_number_old		=> row_number_old,
						column_number_old	=> column_number_old,
						row_number_new		=> row_number_new,
						column_number_new	=> column_number_new
					);

	CR1: coordinate_register	port map (
							clk			=> clk,
							reset			=> reset,
							row_number_reset	=> row_number_reset,
							column_number_reset	=> column_number_reset,
							row_number_in		=> row_number_muxxed,
							column_number_in	=> column_number_muxxed,
							row_number_out		=> row_number_old,
							column_number_out	=> column_number_old
						);

	IS1: input_system	port map (
						clk		=> clk,
						reset		=> reset,
						data_input	=> dir_in,
						data_output	=> move
					);

end architecture structural;
