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
	-- col_sel_proc:
	-- On change of the "column_select" bus, use the "row_select" and "column_select" busses to
	-- 	select the corresponding cell
	---------------------------------------------------------------------------------------------------------
	col_sel_proc: process(column_select)
	begin
		if unsigned(column_select) < 24 then
			cell_value <= row_cells(to_integer(unsigned(column_select)));
		else
			cell_value <= '0';
		end if;
	end process;

end architecture behaviour;