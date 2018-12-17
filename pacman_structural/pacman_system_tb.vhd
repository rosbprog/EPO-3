library IEEE;
use IEEE.std_logic_1164.all;


entity pacman_system_tb is
end entity pacman_system_tb;


architecture structural of pacman_system_tb is

	component pacman_system is
		port (
			clk			: in	std_logic;
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
			en_wall			: out	std_logic
		);
	end component pacman_system;

	signal clk, reset, start, wall_present, ghost_present, rip, ready, write_coin, en_wall	: std_logic;
	signal row_number_old, column_number_old, row_number_new, column_number_new,
		row_number_reset, column_number_reset						: std_logic_vector(4 downto 0);
	signal dir_in										: std_logic_vector(3 downto 0);

begin

	PS1: pacman_system port map (
					clk			=> clk,
					reset			=> reset,
					row_number_old		=> row_number_old,
					column_number_old	=> column_number_old,
					row_number_new		=> row_number_new,
					column_number_new	=> column_number_new,
					row_number_reset	=> row_number_reset,
					column_number_reset	=> column_number_reset,
					dir_in			=> dir_in,
					start			=> start,
					wall_present		=> wall_present,
					ghost_present		=> ghost_present,
					rip			=> rip,
					ready			=> ready,
					write_coin		=> write_coin,
					en_wall			=> en_wall
				);

	clk <=	'0' after 0 ns,
		'1' after 5 ns when clk /= '1' else '0' after 5 ns;

	reset <=	'1' after 0 ns,
			'0' after 20 ns;

	row_number_reset	<=	"00001" after 0 ns;
	column_number_reset	<=	"00001" after 0 ns;

	dir_in			<=	"0000" after 0 ns,
					"0001" after 40 ns;

	start			<=	'0' after 0 ns,
					'1' after 60 ns when start /= '1' else '0' after 10 ns;

	wall_present		<=	'0' after 0 ns,
					'1' after 500 ns,
					'0' after 600 ns;

	ghost_present		<=	'0' after 0 ns,
					'1' after 620 ns,
					'0' after 640 ns;

end architecture structural;