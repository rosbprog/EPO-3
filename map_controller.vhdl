library IEEE;
use IEEE.std_logic_1164.all;


entity map_controller is
	port (
		row_select	: in	std_logic_vector(4 downto 0);	-- Input bus for selecting row to put on the output bus
		row_cells	: out	std_logic_vector(23 downto 0)	-- Output bus representing all cells in specified row
	);
end entity map_controller;


architecture behavioural_map_controller of map_controller is
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

end architecture behavioural_map_controller;
