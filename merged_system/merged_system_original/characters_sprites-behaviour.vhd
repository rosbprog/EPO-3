library IEEE;
use IEEE.std_logic_1164.all;

architecture behavioural of character_sprite is
begin
	lbl1: process(y_pos, char_sprite_select)

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
		if (char_sprite_select = "00000") then 	-- zero or O
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "00111100";
			else
				row_out <= "01100110";
			end if;
		elsif (char_sprite_select = "00001") then		-- one
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
		elsif (char_sprite_select = "00010") then 		-- two
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
		elsif (char_sprite_select = "00011") then 		-- three
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
		elsif (char_sprite_select = "00100") then 		-- four
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
		elsif (char_sprite_select = "00101") then 		-- five
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
		elsif (char_sprite_select = "00110") then 		-- six
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
		elsif (char_sprite_select = "00111") then 		-- seven
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
		elsif (char_sprite_select = "01000") then 		-- eight
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(4) OR y_pos = vpos(7)) then
				row_out <= "00111100";
			else
				row_out <= "01100110";
			end if;
		elsif (char_sprite_select = "01001") then 		-- nine
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
		elsif (char_sprite_select = "01010") then 		-- S
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
		elsif (char_sprite_select = "01011") then 		-- C
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "00111000";
			elsif (y_pos = vpos(2) OR y_pos = vpos(6)) then
				row_out <= "01101100";
			else
				row_out <= "00000110";
			end if;
		elsif (char_sprite_select = "01101") then 		-- R
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(4)) then
				row_out <= "00111110";
			elsif (y_pos = vpos(5)) then
				row_out <= "00110110";
			else
				row_out <= "01100110";
			end if;
		elsif (char_sprite_select = "01110") then 		-- E
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "01111110";
			elsif (y_pos = vpos(4)) then
				row_out <= "01111100";
			else
				row_out <= "00000110";
			end if;
		elsif (char_sprite_select = "01111") then							-- ':'
			if (y_pos = vpos(0) OR y_pos = vpos(1) OR y_pos = vpos(4) OR y_pos = vpos(7)) then
				row_out <= "00000000";
			else
				row_out <= "00011000";
			end if;
		elsif (char_sprite_select = "10000") then -- G
			if (y_pos = vpos(1) OR y_pos = vpos(7)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(2) OR y_pos = vpos(6)) then
				row_out <= "01100110";
			elsif (y_pos = vpos(3) OR y_pos = vpos(4)) then
				row_out <= "00000110";
			elsif (y_pos = vpos(5)) then
				row_out <= "01110110";
			else
				row_out <= "00000000";
			end if;
		elsif (char_sprite_select = "10001") then -- A
			if (y_pos = vpos(1)) then
				row_out <= "00011000";
			elsif (y_pos = vpos(2)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(5) OR y_pos = vpos(6)) then
				row_out <= "01111110";
			elsif (y_pos = vpos(0)) then
				row_out <= "00000000";
			else
				row_out <= "01100110";
			end if;
		elsif (char_sprite_select = "10010") then --M
			if (y_pos = vpos(2)) then
				row_out <= "01100110";
			elsif (y_pos = vpos(3)) then
				row_out <= "01111110";
			elsif (y_pos = vpos(4)) then
				row_out <= "01011010";
			elsif (y_pos = vpos(0)) then
				row_out <= "00000000";
			else
				row_out <= "01000010";
			end if;
		elsif (char_sprite_select = "10011") then --T
			if (y_pos = vpos(1) OR y_pos = vpos(2)) then
				row_out <= "01111110";
			elsif (y_pos = vpos(0)) then
				row_out <= "00000000";
			else
				row_out <= "00011000";
			end if;
		elsif (char_sprite_select = "10100") then	--V
			if (y_pos = vpos(6)) then
				row_out <= "00111100";
			elsif (y_pos = vpos(7)) then
				row_out <= "00011000";
			elsif (y_pos = vpos(0)) then
				row_out <= "00000000";
			else
				row_out <= "01100110";
			end if;
		elsif (char_sprite_select = "10110") then --P
			if (y_pos = vpos(0)) then
					row_out <= "00000000";
			elsif (y_pos = vpos(1) OR y_pos = vpos(4)) then
				row_out <= "00111110";
			elsif (y_pos = vpos(2) OR y_pos = vpos(3)) then
				row_out <= "01100110";
			else
				row_out <= "00000110";
			end if;
		elsif (char_sprite_select = "10111") then --N
			if (y_pos = vpos(0)) then
				row_out <= "00000000";
			elsif (y_pos = vpos(2)) then
				row_out <= "01000110";
			elsif (y_pos = vpos(3)) then
				row_out <= "01001010";
			elsif (y_pos = vpos(4)) then
				row_out <= "01010010";
			elsif (y_pos = vpos(5)) then
				row_out <= "01100010";
			else
				row_out <= "01000010";
			end if;
		elsif (char_sprite_select = "11000") then -- '-'
			if (y_pos = vpos(3) or y_pos = vpos(4)) then
				row_out <= "00111100";
			else
				row_out <= "00000000";
			end if;
		else -- empty [can be invoked using the remaining
				 -- combinations among which "01100" and "10101"]
			row_out <= "00000000";
		end if;
	end process;
end architecture behavioural;
