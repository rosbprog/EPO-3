library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of vc is
signal county, current_block_horizontal, current_block_vertical : INTEGER;
signal waiting, done0, done4, done7, dual_pixel_y: std_logic;
signal pixel_arr_buffer: std_logic_vector(7 downto 0);
signal colour_buffer: std_logic_vector(2 downto 0);
type vc_state is(reset_state, wait_state, pixel_0,pixel_1,pixel_2,pixel_3,pixel_4,pixel_5,pixel_6,pixel_7);
signal new_state, state: vc_state;
begin

--buffer for the input from the sprite register

array_buffer: process(clk, pixel_array(7 downto 0)) 	
begin
if(clk'event and clk = '1') then
	if waiting ='1' then
		pixel_arr_buffer(7 downto 0)<=pixel_array(7 downto 0);
	elsif done0 = '1' then 
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
if(clk'event  and clk = '1') then
	if done7 = '1' then 
		colour_buffer<=sprite_colour;
	else
		colour_buffer <= colour_buffer;
	end if;
else
	colour_buffer <= colour_buffer;
end if;
end process;

--process using case statements for the x count, thus keeping track of which pixel inside the 8-wide array should be drawn. 
--At pixel 0, the final four bits are loaded, at pixel 5 the first four bits are loaded. 
--At pixel 8 the new colours are loaded into the buffer

ib11: process(clk, reset)
begin
if(clk'event and clk = '1') then
	if reset = '1' then
		state<= reset_state;
	else
		state<= new_state;
	end if;
end if;
end process;

lb12: process(sync, cell_type, sprite_colour, pixel_array, state)
begin
case state is
	when reset_state  =>
		waiting <= '1';
		done0 <= '0';
		done4 <= '0';
		done7 <= '1';
		county <= 0;
		current_block_horizontal <= 0;
		current_block_vertical <= 0;
		dual_pixel_y<='0';

		colour<="000";

		xcoordinates <= "00000";
		ycoordinates <= "00000";
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		new_state<=wait_state;
	when wait_state  =>
		waiting <= '1';
		done0 <= '0';
		done4 <= '0';
		done7 <= '1';

		county <= county;
		current_block_horizontal <= current_block_horizontal;
		current_block_vertical <= current_block_vertical;
		dual_pixel_y<=dual_pixel_y;

		colour<="000";

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal,5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		if sync='1' then
			new_state <= pixel_0;
		else
			new_state<=wait_state;
		end if;
	when  pixel_0  =>	
		waiting<='0';
		done0 <= '1';
		done4 <= '0';
		done7 <= '0';

		county <= county;
		current_block_horizontal <= current_block_horizontal;
		current_block_vertical <= current_block_vertical;
		dual_pixel_y<=dual_pixel_y;

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(0));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(0));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(0));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal,5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		new_state<=pixel_1;
	when pixel_1 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';

		county <= county;
		current_block_horizontal <= current_block_horizontal;
		current_block_vertical <= current_block_vertical;
		dual_pixel_y<=dual_pixel_y;


		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(1));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(1));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(1));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		new_state<=pixel_2;
	when pixel_2 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';

		county <= county;
		current_block_horizontal <= current_block_horizontal;
		current_block_vertical <= current_block_vertical;
		dual_pixel_y<=dual_pixel_y;


		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(2));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(2));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(2));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		new_state<=pixel_3;
	when pixel_3 =>	
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';

		county <= county;
		current_block_horizontal <= current_block_horizontal;
		current_block_vertical <= current_block_vertical;
		dual_pixel_y<=dual_pixel_y;

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(3));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(3));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(3));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		new_state<=pixel_4;
	when pixel_4 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '1';
		done7 <= '0';

		county <= county;
		current_block_horizontal <= current_block_horizontal;
		current_block_vertical <= current_block_vertical;
		dual_pixel_y<=dual_pixel_y;


		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(4));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(4));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(4));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		new_state<=pixel_5; 
	when pixel_5 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';		

		county <= county;
		current_block_horizontal <= current_block_horizontal;
		current_block_vertical <= current_block_vertical;
		dual_pixel_y<=dual_pixel_y;


		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(5));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(5));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(5));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		new_state<=pixel_6; 
	when pixel_6 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';		

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(6));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(6));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(6));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));
		new_state<=pixel_7; 
	when pixel_7 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '1';

		colour(0) <= (sprite_colour(0) AND pixel_arr_buffer(7));
		colour(1) <= (sprite_colour(1) AND pixel_arr_buffer(7));
		colour(2) <= (sprite_colour(2) AND pixel_arr_buffer(7));

		xcoordinates <= std_logic_vector(to_unsigned(current_block_horizontal, 5));
		ycoordinates <= std_logic_vector(to_unsigned(current_block_vertical,5));
		sprite_type<=cell_type;
		y_pos <= std_logic_vector(to_unsigned(county,3));

			if current_block_horizontal = 23 then
				current_block_horizontal <= 0;
				new_state<=wait_state;
				if county = 7 AND dual_pixel_y='1' then
					county <= 0;
					if current_block_vertical = 23 then
						current_block_vertical <= 0;
					else
						current_block_vertical <= current_block_vertical + 1;
					end if;
				else 
					if dual_pixel_y = '1' then
						county <= county +1;
						dual_pixel_y<='0';
					else 
						dual_pixel_y<='1';
						county<=county;
					end if;
				end if;
			else
				current_block_horizontal <= current_block_horizontal + 1;
				new_state<= pixel_0;
				current_block_vertical<=current_block_vertical;
				county<=county;
			end if;

	end case;
end process;		
			

end behaviour;

