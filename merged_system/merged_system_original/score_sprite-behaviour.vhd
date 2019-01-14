library IEEE;
use IEEE.std_logic_1164.all;

architecture behavioural of score_sprite is
begin
	lbl1: process(y_pos, score_sprite_select)

	type T_Data is array (0 to 7)
        of std_logic_vector(2 downto 0);
  	constant vpos : T_DATA :=
               ("000", 	-- row 1
             	"001",
             	"010",
             	"011",
		"100",
		"101",
		"110",
		"111"	-- row 8
		);

	begin
		if (score_sprite_select = "0000") then 	-- zero or O
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "00111100";
			else
				row_out <= "01100110";
			end if;
		elsif (score_sprite_select = "0001") then		-- one
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(2)) then
				row_out <= "00011100";
			elsif (y_pos = vpos(3)) then
				row_out <= "00011110";
			elsif (y_pos = vpos(7)) then
				row_out <= "01111110";
			else
				row_out <= "00011000";
			end if;
		elsif (score_sprite_select = "0010") then 		-- two
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(2)) then
				row_out <= "01100110";
			elsif (y_pos = vpos(3)) then
				row_out <= "01100000";
			elsif (y_pos = vpos(4)) then
				row_out <= "00110000";
			elsif (y_pos = vpos(5)) then
				row_out <= "00011000";
			elsif (y_pos = vpos(6)) then
				row_out <= "00001100";
			else
				row_out <= "01111110";
			end if;
		elsif (score_sprite_select = "0011") then 		-- three
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(2) OR y_pos = vpos(6)) then
				row_out <= "01100110";
			elsif (y_pos = vpos(3) OR y_pos = vpos(5)) then
				row_out <= "01100000";
			else
				row_out <= "00011000";
			end if;
		elsif (score_sprite_select = "0100") then 		-- four
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(6) OR y_pos = vpos(7)) then
				row_out <= "00110000";
			elsif (y_pos = vpos(2)) then
				row_out <= "00111000";
			elsif (y_pos = vpos(3)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(4)) then
				row_out <= "00110110";
			else
				row_out <= "01111110";
			end if;
		elsif (score_sprite_select = "0101") then 		-- five
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1)) then
				row_out <= "01111110";
			elsif (y_pos = vpos(2)) then
				row_out <= "00000110";
			elsif (y_pos = vpos(3)) then
				row_out <= "00111110";
			elsif (y_pos = vpos(6)) then
				row_out <= "01100110";
			elsif (y_pos = vpos(7)) then
				row_out <= "00111100";
			else
				row_out <= "01100000";
			end if;
		elsif (score_sprite_select = "0110") then 		-- six
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(3)) then
				row_out <= "00000110";
			elsif (y_pos = vpos(4)) then
				row_out <= "00111110";
			else
				row_out <= "01100110";
			end if;
		elsif (score_sprite_select = "0111") then 		-- seven
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1)) then
				row_out <= "01111110";
			elsif (y_pos = vpos(2)) then
				row_out <= "01100110";
			elsif (y_pos = vpos(3) OR y_pos = vpos(4)) then
				row_out <= "00110000";
			else
				row_out <= "00011000";
			end if;
		elsif (score_sprite_select = "1000") then 		-- eight
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(4) OR y_pos = vpos(7)) then
				row_out <= "00111100";
			else
				row_out <= "01100110";
			end if;
		elsif (score_sprite_select = "1001") then 		-- nine
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(4)) then
				row_out <= "01111100";
			elsif (y_pos = vpos(5)) then
				row_out <= "01100000";
			else
				row_out <= "01100110";
			end if;
		elsif (score_sprite_select = "1010") then 		-- S
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(3)) then
				row_out <= "00001110";
			elsif (y_pos = vpos(4)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(5)) then
				row_out <= "01110000";
			else
				row_out <= "01100110";
			end if;
		elsif (score_sprite_select = "1011") then 		-- C
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "00111000";
			elsif (y_pos = vpos(2) OR y_pos = vpos(6)) then
				row_out <= "01101100";
			else
				row_out <= "00000110";
			end if;
		elsif (score_sprite_select = "1101") then 		-- R
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(4)) then
				row_out <= "00111110";
			elsif (y_pos = vpos(5)) then
				row_out <= "00110110";
			else
				row_out <= "01100110";
			end if;
		elsif (score_sprite_select = "1110") then 		-- E
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "01111110";
			elsif (y_pos = vpos(4)) then
				row_out <= "01111100";
			else
				row_out <= "00000110";
			end if;
		elsif (score_sprite_select = "1100") then 		-- E
				row_out <= "00000000";
		else							-- ':'
			if (y_pos = vpos(0) OR y_pos = vpos(4)) then
				row_out <= "00000000";
			else
				row_out <= "00111100";
			end if;
		end if;
	end process;
end architecture behavioural;

