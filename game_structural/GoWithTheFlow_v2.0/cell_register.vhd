library IEEE;
use IEEE.std_logic_1164.all;


entity cell_register is
	port (
		coin_present		: in std_logic;				-- Input signal, when '1', a coin is present in the requested cell
		wall_present		: in std_logic;				-- Input signal, when '1', a wall is present in the requested cell
		vc_done_in		: in std_logic;				-- Input signal, when '1', the video controller gives control back
										--	to the other components to access the registers
		score_pulse_in		: in std_logic;				-- Input signal, where a pulse represents an increment of the score
		score_reset_in		: in std_logic;				-- Input signal, for resetting the score counter
		is_game_over_in		: in std_logic;				-- Input signal, when '1', the game is over

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
		vc_has_priority		: out std_logic;			-- Output signal, is set to '1' when the video controller has
										--	control of the registers (inverse of "vc_done_out")
		score_pulse_out		: out std_logic;			-- Output signal, where a pulse represents an increment of the score
		score_reset_out		: out std_logic;			-- Output signal, for resetting the score counter
		is_game_over_out	: out std_logic				-- Output signal, when '1', the game is over
	);
end entity cell_register;
