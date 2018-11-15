library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of vc is
signal countx, county, current_block_horizontal, current_block_vertical : INTEGER;
signal done0, done4, done7: std_logic;
signal pixel_arr_buffer: std_logic_vector(7 downto 0);
signal colour_buffer: std_logic_vector(2 downto 0);
begin

--buffer for the input from the sprite register

array_buffer: process(clk, pixel_array(7 downto 0)) 	
begin
if(clk'event and clk = '1') then
	if done0 = '1' then 
		pixel_arr_buffer(7 downto 4)<=pixel_array(7 downto 4);
		pixel_arr_buffer(3 downto 0)<= pixel_arr_buffer(3 downto 0);
	elsif done4 = '1' then
		pixel_arr_buffer(3 downto 0)<=pixel_array(3 downto 0);
		pixel_arr_buffer(7 downto 4)<= pixel_arr_buffer(7 downto 4);
	else
		pixel_arr_buffer(7 downto 0)<= pixel_arr_buffer(7 downto 0);
	end if;
else
	pixel_arr_buffer(7 downto 0)<= pixel_arr_buffer(7 downto 0);
end if;
end process;

-- buffer for the colour input of the sprite buffer

col_buf: process(clk, pixel_array(7 downto 0))
begin
if(clk'event and clk = '1') then
	if done7 = '1' then 
		colour_buffer<=sprite_colour;
	else
		colour_buffer <= colour_buffer;
	end if;
else
	colour_buffer <= colour_buffer;
end if;
end process;

--process using if statements for the x count, thus keeping track of which pixel inside the 8-wide array should be drawn. 
--At pixel 0, the final four bits are loaded, at pixel 5 the first four bits are loaded. 
--At pixel 8 the new colours are loaded into the buffer

clkrst: process(clk)
begin
if(clk'event and clk = '1') then
	if reset = '1' then
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';
		colour <= "000";
		xcoordinates <= "00000";
		ycoordinates <= "00000";
		sprite_type<="000";
		y_pos <= "000";
		countx <= 0;
		county <= 0;
		current_block_horizontal <= 0;
		current_block_vertical <= 0;
	elsif countx = 0 then		
		done0 <= '1';
		done4 <= '0';
		done7 <= '0';

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(countx));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(countx));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(countx));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal,5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		countx <= countx + 1;
	elsif countx = 1 then		
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';
		current_block_horizontal <= current_block_horizontal + 1;

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(countx));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(countx));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(countx));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		countx <= countx + 1;
	elsif countx = 2 or countx = 3 then		
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(countx));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(countx));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(countx));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		countx <= countx + 1;
	elsif countx = 4 then		
		done0 <= '0';
		done4 <= '1';
		done7 <= '0';

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(countx));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(countx));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(countx));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		countx <= countx + 1;
	elsif countx = 5 or countx = 6 then		
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';		

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(countx));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(countx));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(countx));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		countx <= countx + 1;
	elsif countx = 7 then		
		done0 <= '0';
		done4 <= '0';
		done7 <= '1';

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(countx));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(countx));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(countx));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		if county = 7 then
			county<=0;
			current_block_vertical <= current_block_vertical + 1;
		else
			county<= county + 1;
		end if;
		current_block_horizontal <= current_block_horizontal + 1;
		countx <= 0;
		
		
		
		
		
	end if;
end if;
end process;		
			

end behaviour;

