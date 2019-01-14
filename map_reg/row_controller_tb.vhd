library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity row_controller_tb is
end entity row_controller_tb;


architecture behavioural_row_controller_tb of row_controller_tb is

	component row_controller is
		port (
			row_select	: in std_logic_vector(4 downto 0);
			row_cells	: out std_logic_vector(23 downto 0)
		);
	end component row_controller;

	signal row_select	: std_logic_vector(4 downto 0);
	signal row_cells	: std_logic_vector(23 downto 0);

begin	

	RC1: entity work.row_controller(behavioural_half) port map (
									row_select 	=> row_select,
									row_cells	=> row_cells
								);
	row_select <=	"01001" after 0 ns,	-- row 9
		      	"01110" after 100 ns,	-- row 14
			"11000" after 200 ns;	-- row 24

end architecture behavioural_row_controller_tb;
