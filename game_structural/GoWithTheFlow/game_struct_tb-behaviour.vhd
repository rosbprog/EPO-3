library IEEE;
use IEEE.std_logic_1164.all;


entity game_struct_tb is
end entity game_struct_tb;


architecture structural of game_struct_tb is

	component game_struct is
		port (
			clk		: in	std_logic;
			reset		: in	std_logic;
			dir_pacman	: in	std_logic_vector(3 downto 0);
			dir_ghost1	: in	std_logic_vector(3 downto 0);
			dir_ghost2	: in	std_logic_vector(3 downto 0);
			vc_done_in		: in	std_logic;
			row_request	: in	std_logic_vector(4 downto 0);
			col_request	: in	std_logic_vector(4 downto 0);
			score_pulse	: out	std_logic;
			score_reset_out	: out	std_logic;
			game_over_out : out std_logic;
			cell_type	: out	std_logic_vector(2 downto 0)
		);
	end component game_struct;

	signal clk, reset, vc_done_in, game_over_out, score_pulse, score_reset_out	: std_logic;
	signal dir_pacman, dir_ghost1, dir_ghost2				: std_logic_vector(3 downto 0);
	signal row_request, col_request						: std_logic_vector(4 downto 0);
	signal cell_type							: std_logic_vector(2 downto 0);

begin

	GS1: game_struct port map (
					clk		=> clk,
					reset		=> reset,
					dir_pacman	=> dir_pacman,
					dir_ghost1	=> dir_ghost1,
					dir_ghost2	=> dir_ghost2,
					vc_done_in		=> vc_done_in,
					row_request	=> row_request,
					col_request	=> col_request,
					score_pulse	=> score_pulse,
					score_reset_out	=> score_reset_out,
					game_over_out => game_over_out,
					cell_type	=> cell_type
				);

	clk <=	'0' after 0 ns,
		'1' after 5 ns when clk /= '1' else '0' after 5 ns;

	reset <=	'1' after 0 ns,
			'0' after 50 ns;

	dir_pacman <=	"0000" after 0 ns, "1000" after 100 ns;
	dir_ghost1 <=	"0000" after 0 ns, "1000" after 100 ns;
	dir_ghost2 <=	"0000" after 0 ns, "1000" after 100 ns;

	vc_done_in <=	'0' after 0 ns,
			'1' after 100 ns when vc_done_in /= '1' else '0' after 100 ns;

	row_request <=	"01011" after 0 ns;	-- row 11

	col_request <=	"00000" after 0 ns,	-- column 0
			"00001" after 60 ns,	-- column 1
			"00010" after 65 ns,	-- column 2
			"00011" after 70 ns,	-- column 3
			"00100" after 75 ns,	-- column 4
			"00101" after 80 ns,	-- column 5
			"00110" after 85 ns,	-- column 6
			"00111" after 90 ns,	-- column 7
			"01000" after 95 ns,	-- column 8
			"01001" after 205 ns,	-- column 9
			"01010" after 210 ns,	-- column 10
			"01011" after 215 ns,	-- column 11
			"01100" after 220 ns,	-- column 12
			"01101" after 225 ns,	-- column 13
			"01110" after 230 ns,	-- column 14
			"01111" after 235 ns,	-- column 15
			"10000" after 240 ns,	-- column 16
			"10001" after 245 ns,	-- column 17
			"10010" after 250 ns,	-- column 18
			"10011" after 255 ns,	-- column 19
			"10100" after 260 ns,	-- column 20
			"10101" after 265 ns,	-- column 21
			"10110" after 270 ns,	-- column 22
			"10111" after 275 ns,	-- column 23
			"11000" after 280 ns;	-- column 24

end architecture structural;
