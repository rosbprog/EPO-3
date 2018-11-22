library IEEE;
use IEEE.std_logic_1164.all;

entity sprite is
	port(  	y_pos		:in std_logic_vector (2 downto 0); 
		--Upper row is 111, lower is 000
	 	sprite_select	:in std_logic_vector (2 downto 0); 
		--000 coin, 001 ghost_red, 010 ghost_green, 011 pacman, 100 wall
		--101/110/111 becomes open i.e. black square
		color_out 	:out std_logic_vector (2 downto 0); --respectively RGB	
		row_out		:out std_logic_vector (7 downto 0)  --left to right		
		);
end entity sprite;

architecture behavioural of sprite is
begin
	process(y_pos, sprite_select)
		begin
			if(sprite_select = "000") then  --coin
				color_out <= "111";				--white
				if(y_pos = "010" OR y_pos = "101") then		-- row 3 and 6
					row_out <= "00011000";
				elsif(y_pos = "011" OR y_pos = "100") then	-- row 4 and 5
					row_out <= "00111100";
				else						-- rows 1,2,7,8
					row_out <= "00000000";
				end if; 
			
			elsif(sprite_select = "001") then  --ghost red
				color_out <= "100";						-- red
				if(y_pos = "010" OR y_pos = "100" OR y_pos = "101") then	-- rows 3,5,6
					row_out <= "01111110";
				elsif(y_pos = "011" OR y_pos = "110") then 			-- rows 4 and 7
				   	row_out <= "01011010";
				elsif(y_pos = "001") then					-- row 2
					row_out <= "00111100"; 
				else								-- rows 1 and 8
					row_out <= "00000000";
				end if; 

			elsif(sprite_select = "010") then  --ghost green
				color_out <= "010";						-- green
				if(y_pos = "010" OR y_pos = "100" OR y_pos = "101") then	-- rows 3,5,6
					row_out <= "01111110";
				elsif(y_pos = "011" OR y_pos = "110") then 			-- rows 4 and 7
				   	row_out <= "01011010";
				elsif(y_pos = "001") then					-- row 2
					row_out <= "00111100"; 
				else								-- rows 1 and 8
					row_out <= "00000000";
				end if; 
				
			elsif(sprite_select = "011") then   --pacman
				color_out <= "110";
				if(y_pos = "001" OR y_pos = "110") then 	-- row 2 and 7
					row_out <= "00111100";		
				elsif(y_pos = "010") then			--row 3
					row_out <= "01110110";
				elsif(y_pos = "100") then			--row 5
					row_out <= "01111000";
				elsif(y_pos = "011" OR y_pos = "101") then	--row 4 and 6
					row_out <= "01111110";
				else						--row 1 and 8
				   row_out <= "00000000"; 
				end if;
					
			elsif(sprite_select = "100") then  --wall
				color_out <= "001";				-- blue	
				row_out <= "11111111";				-- all rows

			else  				--open
				color_out <= "000";				-- black	
				row_out <= "11111111";				-- all rows
			end if; 
	end process;
end architecture behavioural;
