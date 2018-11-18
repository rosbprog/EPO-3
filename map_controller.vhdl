library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity map_controller is
	port (
		row_select	: in	std_logic_vector(4 downto 0);	-- Input bus for selecting row to put on the output bus
		row_cells	: out	std_logic_vector(23 downto 0)	-- Output bus representing all cells in specified row
	);
end entity map_controller;


---------------------------------------------------------------------------------------------------------
-- TSMC SYNTHESIS RESULT:
-- Inverter Cells:	10
-- Logic Cells:		46
-- Total Area:		990.035 um^2
---------------------------------------------------------------------------------------------------------
architecture behavioural_map_controller_all of map_controller is
begin

	---------------------------------------------------------------------------------------------------------
	-- get_row_proc:
	-- Get the cells in the row selected by the 'row_select' bus
	---------------------------------------------------------------------------------------------------------
	get_row_proc: process(row_select)
	begin
		case row_select is
			when "00000" =>
				row_cells <= "111111111111111111111111";
			when "00001" =>
				row_cells <= "110000000001100000000011";
			when "00010" =>
				row_cells <= "100110110101101011011001";
			when "00011" =>
				row_cells <= "101100110101101011001101";
			when "00100" =>
				row_cells <= "101101110101101011101101";
			when "00101" =>
				row_cells <= "100000000000000000000001";
			when "00110" =>
				row_cells <= "111111010111111010111111";
			when "00111" =>
				row_cells <= "111111010001100010111111";
			when "01000" =>
				row_cells <= "100000011101101110000001";
			when "01001" =>
				row_cells <= "101111010000000010111101";
			when "01010" =>
				row_cells <= "101001000110011000100101";
			when "01011" =>
				row_cells <= "101001010100001010100101";
			when "01100" =>
				row_cells <= "101001010100001010100101";
			when "01101" =>
				row_cells <= "101001000111111000100101";
			when "01110" =>
				row_cells <= "101111010000000010111101";
			when "01111" =>
				row_cells <= "100000011101101110000001";
			when "10000" =>
				row_cells <= "111111010001100010111111";
			when "10001" =>
				row_cells <= "111111010111111010111111";
			when "10010" =>
				row_cells <= "100000000000000000000001";
			when "10011" =>
				row_cells <= "101101110101101011101101";
			when "10100" =>
				row_cells <= "101100110101101011001101";
			when "10101" =>
				row_cells <= "100110110101101011011001";
			when "10110" =>
				row_cells <= "110000000001100000000011";
			when "10111" =>
				row_cells <= "111111111111111111111111";
			when others =>
				row_cells <= "000000000000000000000000";
		end case;
	end process;

end architecture behavioural_map_controller_all;


---------------------------------------------------------------------------------------------------------
-- TSMC SYNTHESIS RESULT:
-- Inverter Cells:	4
-- Logic Cells:		37
-- Total Area:		807.834 um^2
---------------------------------------------------------------------------------------------------------
architecture behavioural_map_controller_half of map_controller is
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

end architecture behavioural_map_controller_half;


---------------------------------------------------------------------------------------------------------
-- TSMC SYNTHESIS RESULT:
-- Inverter Cells:	5
-- Logic Cells:		37
-- Total Area:		812.224 um^2
---------------------------------------------------------------------------------------------------------
architecture behavioural_map_controller_quarter of map_controller is
	signal row_cells_half	: std_logic_vector(11 downto 0);
begin
	-- Copy and paste 'row_cells_half' to the first 12 signals of 'row_cells'
	row_cells(11 downto 0) <= row_cells_half;
	-- Copy 'row_cells_half' and pase it in reverse to the other 12 signals of 'row_cells' 
	row_cells(12) <= row_cells_half(11);
	row_cells(13) <= row_cells_half(10);
	row_cells(14) <= row_cells_half(9);
	row_cells(15) <= row_cells_half(8);
	row_cells(16) <= row_cells_half(7);
	row_cells(17) <= row_cells_half(6);
	row_cells(18) <= row_cells_half(5);
	row_cells(19) <= row_cells_half(4);
	row_cells(20) <= row_cells_half(3);
	row_cells(21) <= row_cells_half(2);
	row_cells(22) <= row_cells_half(1);
	row_cells(23) <= row_cells_half(0);

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
				row_cells_half <= "111111111111";
			when 1 =>
				row_cells_half <= "110000000001";
			when 2 =>
				row_cells_half <= "100110110101";
			when 3 =>
				row_cells_half <= "101100110101";
			when 4 =>
				row_cells_half <= "101101110101";
			when 5 =>
				row_cells_half <= "100000000000";
			when 6 =>
				row_cells_half <= "111111010111";
			when 7 =>
				row_cells_half <= "111111010001";
			when 8 =>
				row_cells_half <= "100000011101";
			when 9 =>
				row_cells_half <= "101111010000";
			when 10 =>
				row_cells_half <= "101001000110";
			when 11 =>
				row_cells_half <= "101001010100";
			when others =>
				row_cells_half <= "000000000000";
		end case;
	end process;

end architecture behavioural_map_controller_quarter;
