library IEEE;
use IEEE.std_logic_1164.all;

architecture behaviour of sprite is
signal sprite_type: std_logic_vector (2 downto 0);
signal rotation: std_logic_vector (1 downto 0);
signal mouth: std_logic;

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
sprite_type <= sprite_select(2 downto 0);
rotation <= sprite_select (4 downto 3);
mouth <= sprite_select(5);

		process(y_pos, sprite_select)
			begin
				if(sprite_type = "001") then
					color_out <= "110";
					if (mouth = '0') then
									if (rotation = "00") then
										if(y_pos = vpos(1) OR y_pos = vpos(6)) then
											row_out <= "00111100";
										elsif(y_pos = vpos(2)) then
											row_out <= "01101110";
										elsif(y_pos = vpos(3) OR y_pos = vpos(5)) then
											row_out <= "01111110";
										elsif(y_pos = vpos(4)) then
											row_out <= "00011110";
										else
										   row_out <= "00000000";
										end if;
									elsif (rotation = "01") then
										if(y_pos = vpos(1)) then
											row_out <= "00111100";
										elsif (y_pos = vpos(2) OR y_pos = vpos(3)) then
											row_out <= "01111110";
										elsif (y_pos = vpos(4)) then
											row_out <= "01011110";
										elsif (y_pos = vpos(5)) then
											row_out <= "01110110";
										elsif (y_pos = vpos(6)) then
											row_out <= "00110100";
										else
											row_out <= "00000000";
										end if;
									elsif (rotation = "10") then
										if(y_pos = vpos(1) OR y_pos = vpos(6)) then
											row_out <= "00111100";
										elsif (y_pos = vpos(2)) then
											row_out <= "01110110";
										elsif(y_pos = vpos(3) OR y_pos = vpos(5)) then
											row_out <= "01111110";
										elsif(y_pos = vpos(4)) then
											row_out <= "01111000";
										else
										   row_out <= "00000000";
										end if;
									else
										if (y_pos = vpos(1)) then
											row_out <= "00110100";
										elsif (y_pos = vpos(2)) then
											row_out <= "01110110";
										elsif (y_pos = vpos(3)) then
											row_out <= "01011110";
										elsif (y_pos = vpos(4) OR y_pos = vpos(5)) then
											row_out <= "01111110";
										elsif(y_pos = vpos(6)) then
											row_out <= "00111100";
										else
											row_out <= "00000000";
										end if;
									end if;
					elsif (mouth = '1') then
								if (rotation = "00") then
									if(y_pos = vpos(1) OR y_pos = vpos(6)) then
										row_out <= "00111100";
									elsif(y_pos = vpos(2)) then
										row_out <= "01101110";
									elsif(y_pos = vpos(3) OR y_pos = vpos(4)) then
										row_out <= "00011110";
									elsif(y_pos = vpos(5)) then
										row_out <= "01111110";
									else
										 row_out <= "00000000";
									end if;
								elsif (rotation = "01") then
									if(y_pos = vpos(1)) then
										row_out <= "00111100";
									elsif (y_pos = vpos(2) OR y_pos = vpos(3)) then
										row_out <= "01111110";
									elsif (y_pos = vpos(4)) then
										row_out <= "01011110";
									elsif (y_pos = vpos(5)) then
										row_out <= "01100110";
									elsif (y_pos = vpos(6)) then
										row_out <= "00100100";
									else
										row_out <= "00000000";
									end if;
								elsif (rotation = "10") then
									if(y_pos = vpos(1) OR y_pos = vpos(6)) then
										row_out <= "00111100";
									elsif (y_pos = vpos(2)) then
										row_out <= "01110110";
									elsif(y_pos = vpos(3) OR y_pos = vpos(4)) then
										row_out <= "01111000";
									elsif( y_pos = vpos(5)) then
										row_out <= "01111110";
									else
										 row_out <= "00000000";
									end if;
								else
									if (y_pos = vpos(1)) then
										row_out <= "00100100";
									elsif (y_pos = vpos(2)) then
										row_out <= "01100110";
									elsif (y_pos = vpos(3)) then
										row_out <= "01011110";
									elsif (y_pos = vpos(4) OR y_pos = vpos(5)) then
										row_out <= "01111110";
									elsif(y_pos = vpos(6)) then
										row_out <= "00111100";
									else
										row_out <= "00000000";
									end if;
								end if;
						end if;
				elsif(sprite_type = "010") then
					color_out <= "100";
					if(y_pos = "010" OR y_pos = "100" OR y_pos = "101") then
						row_out <= "01111110";
					elsif(y_pos = "011" OR y_pos = "110") then
					   	row_out <= "01011010";
					elsif(y_pos = "001") then
						row_out <= "00111100";
					else
						row_out <= "00000000";
					end if;

				elsif(sprite_type = "011") then
					color_out <= "010";
					if(y_pos = "010" OR y_pos = "100" OR y_pos = "101") then
						row_out <= "01111110";
					elsif(y_pos = "011" OR y_pos = "110") then
					   	row_out <= "01011010";
					elsif(y_pos = "001") then
						row_out <= "00111100";
					else
						row_out <= "00000000";
					end if;

				elsif(sprite_type = "101") then
					color_out <= "111";
					if(y_pos = "010" OR y_pos = "101") then
						row_out <= "00011000";
					elsif(y_pos = "011" OR y_pos = "100") then
						row_out <= "00111100";
					else
						row_out <= "00000000";
					end if;

				elsif(sprite_type = "110") then
					color_out <= "001";
					row_out <= "11111111";

				else
					color_out <= "000";
					row_out <= "11111111";
				end if;
		end process;
end behaviour;
