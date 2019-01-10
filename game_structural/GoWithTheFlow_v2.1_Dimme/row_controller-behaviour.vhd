---------------------------------------------------------------------------------------------------------
-- TSMC SYNTHESIS RESULT:
-- Inverter Cells:	4
-- Logic Cells:		37
-- Total Area:		807.834 um^2
---------------------------------------------------------------------------------------------------------
architecture behavioural of row_controller is
begin

	---------------------------------------------------------------------------------------------------------
	-- get_row_proc:
	-- Get the cells in the row selected by the 'row_select' bus
	---------------------------------------------------------------------------------------------------------
	get_row_proc: process(row_select)
		variable row_select_int : integer range 0 to 12;
	begin
		if unsigned(row_select) < 12 then
			row_select_int := to_integer(unsigned(row_select));
		elsif unsigned(row_select) < 24 then
			row_select_int := 23 - to_integer(unsigned(row_select));
		else
			row_select_int := 12;
		end if;

		case row_select_int is
			when 0 =>
				row_cells <= "111111111111111111111111";
			when 1 =>
				row_cells <= "110000000001100000000011";
			when 2 =>
				row_cells <= "100110110101101011011001";
			when 3 =>
				row_cells <= "101100110101101011001101";
			when 4 =>
				row_cells <= "101101110101101011101101";
			when 5 =>
				row_cells <= "100000000000000000000001";
			when 6 =>
				row_cells <= "111111010111111010111111";
			when 7 =>
				row_cells <= "111111010001100010111111";
			when 8 =>
				row_cells <= "100000011101101110000001";
			when 9 =>
				row_cells <= "101111010000000010111101";
			when 10 =>
				row_cells <= "101001000110011000100101";
			when 11 =>
				row_cells <= "101001010100001010100101";
			when others =>
				row_cells <= "000000000000000000000000";
		end case;
	end process;

end architecture behavioural;
