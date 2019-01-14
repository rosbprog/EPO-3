library IEEE;
use IEEE.std_logic_1164.all;


entity pacman_system is
	port (
		clk			: in	std_logic;
		reset			: in	std_logic;

		row_number_old		: out	std_logic_vector(4 downto 0);
		column_number_old	: out	std_logic_vector(4 downto 0);

		row_number_new		: out	std_logic_vector(4 downto 0);
		column_number_new	: out	std_logic_vector(4 downto 0);

		row_number_reset	: in	std_logic_vector(4 downto 0);
		column_number_reset	: in	std_logic_vector(4 downto 0);

		dir_in			: in	std_logic_vector(2 downto 0);
		wall_present		: in	std_logic;
		ghost_present		: in	std_logic;

		start		: in std_logic;
		start_input	: out std_logic;
		rip			: out	std_logic;
		ready			: out	std_logic;
		write_coin		: out	std_logic;
		write_power : out std_logic;
		en_wall			: out	std_logic
	);
end entity pacman_system;

