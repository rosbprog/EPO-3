library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity map_register is
	port (
		clk		: in 	std_logic;			-- System clock (1 Hz assumed)
		row_select	: in 	std_logic_vector(4 downto 0);	-- Input bus for selecting a row
		column_select	: in 	std_logic_vector(4 downto 0);	-- Input bus for selecting a column
		cell_value	: out	std_logic			-- Output bit representing the state of the selected cell:
									-- 	0 = 'empty';	1 = 'wall';
	);
end entity map_register;


architecture behaviour of map_register is

	component row_controller is
		port (
			row_select	: in	std_logic_vector(4 downto 0);
			row_cells	: out	std_logic_vector(23 downto 0)
		);
	end component row_controller;

	signal row_cells	: std_logic_vector(23 downto 0);

begin

	RC1: row_controller port map (
					row_select 	=> row_select,
					row_cells	=> row_cells
				);

	---------------------------------------------------------------------------------------------------------
	-- clk_proc:
	-- On rising edge of the clk signal, using the "row_select" and "column_select" busses,
	-- 	select the corresponding cell
	---------------------------------------------------------------------------------------------------------
	clk_proc: process(clk)
	begin
		if rising_edge(clk) then
			if unsigned(column_select) < 24 then
				cell_value <= row_cells(to_integer(unsigned(column_select)));
			else
				cell_value <= '0';
			end if;
		end if;
	end process;

end architecture behaviour;