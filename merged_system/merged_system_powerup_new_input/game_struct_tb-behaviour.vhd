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
			'0' after 140 ns;
	
	-- "0001" is right, "0010" is up, "0100" is left, "1000" is down.
	dir_pacman <=	"0000" after 0 ns, "0010" after 3000 ns;
	dir_ghost1 <=	"0000" after 0 ns;
	dir_ghost2 <=	"0000" after 0 ns;

	vc_done_in <=	'0' after 0 ns,
			'1' after 100 ns when vc_done_in /= '1' else '0' after 100 ns;

	-- we see: pacman.
	row_request <=	"10010" after 0 ns; 

	col_request <=	"01011" after 0 ns;

end architecture structural;
