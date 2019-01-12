library IEEE;
use IEEE.std_logic_1164.all;


entity input_system_tb is
end entity input_system_tb;


architecture structural of input_system_tb is

	component input_system is
		port (
			clk		: in	std_logic;
			reset		: in	std_logic;

			dir_pacman	: in	std_logic_vector(2 downto 0);
			dir_ghost1	: in	std_logic_vector(2 downto 0);
			dir_ghost2	: in	std_logic_vector(2 downto 0);
	
			dir_out_p1	: out	std_logic_vector(3 downto 0);
			dir_out_p2	: out	std_logic_vector(3 downto 0);
			dir_out_p3	: out	std_logic_vector(3 downto 0);
			start		: out	std_logic
		);
	end component input_system;

	signal clk, reset, start: 			std_logic;
	signal dir_pacman, dir_ghost1, dir_ghost2: 	std_logic_vector(2 downto 0);
	signal dir_out_p1, dir_out_p2, dir_out_p3: 	std_logic_vector(3 downto 0);
begin
	IS1: input_system port map (
					clk, reset, dir_pacman, dir_ghost1, dir_ghost2, dir_out_p1, dir_out_p2, dir_out_p3, start
				);

	clk 	<=	'0' after 0 ns,
			'1' after 5 ns when clk /= '1' else '0' after 5 ns;
	reset	<=	'1' after 0 ns,
			'0' after 20 ns;

	-- "111" is start, "001" is right, "010" is up, "011" is left, "100" is down.
	dir_pacman <=	"000" after 0 ns,
			"100" after 12 ns, 
			"111" after 30 ns,
			"011" after 42 ns;	 
	dir_ghost1 <=	"000" after 0 ns,
			"001" after 5 ns;
	dir_ghost2 <=	"000" after 0 ns, 
			"010" after 5 ns;
end architecture structural;
