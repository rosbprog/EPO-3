library IEEE;
use IEEE.std_logic_1164.all;


entity cell_register_tb is
end entity cell_register_tb;


architecture structural of cell_register_tb is

	component cell_register is
		port (
			coin_present		: in std_logic;				-- Input signal, when '1', a coin is present in the requested cell
			wall_present		: in std_logic;				-- Input signal, when '1', a wall is present in the requested cell
			vc_done_in		: in std_logic;				-- Input signal, when '1', the video controller gives control back
											--	to the other components to access the registers
			score			: in std_logic_vector(9 downto 0);	-- Input bus which contains the score of the current game

			row_number_pacman	: in std_logic_vector(4 downto 0);	-- Input bus which contains the current row number of pacman
			column_number_pacman	: in std_logic_vector(4 downto 0);	-- Input bus which contains the current column number of pacman

			row_number_ghost1	: in std_logic_vector(4 downto 0);	-- Input bus which contains the current row number of ghost1
			column_number_ghost1	: in std_logic_vector(4 downto 0);	-- Input bus which contains the current column number of ghost1

			row_number_ghost2	: in std_logic_vector(4 downto 0);	-- Input bus which contains the current row number of ghost2
			column_number_ghost2	: in std_logic_vector(4 downto 0);	-- Input bus which contains the current column number of ghost2

			row_number_requested	: in std_logic_vector(4 downto 0);	-- Input bus which contains the row number of the requested cell
			column_number_requested	: in std_logic_vector(4 downto 0);	-- Input bus which contains the column number of the requested cell

			row_number_out		: out std_logic_vector(4 downto 0);	-- Output bus which contains the row number of the requested cell
			column_number_out	: out std_logic_vector(4 downto 0);	-- Output bus which contains the column number of the requested cell
											--	Both of the above busses are directly tied to their
											--	"x_number_requested" counterpart

			cell_type		: out std_logic_vector(2 downto 0);	-- Output bus which contains the cell type of the requested cell:
											--	"000"	= empty cell
											--	"001"	= pacman cell
											--	"010"	= ghost1 cell
											--	"011"	= ghost2 cell
											--	"100"	= empty cell
											--	"101"	= coin cell
											--	"110"	= wall cell
											--	"111"	= empty cell

			vc_done_out		: out std_logic;			-- Output signal, is set to '1' when the video controller gives
											--	control back to the other components to access
											--	to the registers (directly tied to vc_done_in)
			vc_has_priority		: out std_logic				-- Output signal, is set to '1' when the video controller has
											--	control of the registers (inverse of "vc_done_out")
		);
	end component cell_register;

	signal coin_present, wall_present, vc_done_in, vc_done_out, vc_has_priority : std_logic;
	signal score : std_logic_vector(9 downto 0);
	signal row_number_pacman, column_number_pacman : std_logic_vector(4 downto 0);
	signal row_number_ghost1, column_number_ghost1 : std_logic_vector(4 downto 0);
	signal row_number_ghost2, column_number_ghost2 : std_logic_vector(4 downto 0);
	signal row_number_requested, column_number_requested : std_logic_vector(4 downto 0);
	signal row_number_out, column_number_out : std_logic_vector(4 downto 0);
	signal cell_type : std_logic_vector(2 downto 0);

begin

	CR1: cell_register port map (
					coin_present => coin_present,
					wall_present => wall_present,
					vc_done_in => vc_done_in,
					vc_done_out => vc_done_out,
					vc_has_priority => vc_has_priority,
					score => score,
					row_number_pacman => row_number_pacman,
					column_number_pacman => column_number_pacman,
					row_number_ghost1 => row_number_ghost1,
					column_number_ghost1 => column_number_ghost1,
					row_number_ghost2 => row_number_ghost2,
					column_number_ghost2 => column_number_ghost2,
					row_number_requested => row_number_requested,
					column_number_requested => column_number_requested,
					row_number_out => row_number_out,
					column_number_out => column_number_out,
					cell_type => cell_type
				);

	coin_present <=	'0' after 0 ns,
			'1' after 10 ns,
			'0' after 50 ns;

	wall_present <= '0' after 0 ns,
			'1' after 50 ns,
			'0' after 90 ns;

	score <= "0000000000";
	vc_done_in <= 	'0' after 0 ns,
			'1' after 10 ns,
			'0' after 20 ns;

	row_number_pacman	<=	"00001" after 0 ns,
					"00011" after 100 ns;
	column_number_pacman	<=	"00000";

	row_number_ghost1	<=	"00010" after 0 ns,
					"00011" after 90 ns;
	column_number_ghost1	<= 	"00000";

	row_number_ghost2	<= "00011";
	column_number_ghost2	<= "00000";

	row_number_requested	<=	"00000" after 0 ns,	-- empty cell
					"00001" after 20 ns,	-- pacman
					"00010" after 30 ns,	-- ghost1
					"00011" after 40 ns,	-- ghost2
					"00000" after 50 ns,	-- empty cell
					"00001" after 60 ns,	-- pacman
					"00010" after 70 ns,	-- ghost1
					"00011" after 80 ns;	-- ghost2
	column_number_requested	<=	"00000";

end architecture structural;