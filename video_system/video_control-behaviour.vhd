library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of video_control is

signal waiting, done0, done4, done7: std_logic;

signal colour_buffer, new_colour_buffer: std_logic_vector(2 downto 0);

signal pixel_arr_buffer, new_pixel_arr_buffer: std_logic_vector(7 downto 0);

type vc_state is(reset_state, wait_state, pixel_0,pixel_1,pixel_2,pixel_3,pixel_4,pixel_5,pixel_6,pixel_7);
signal new_state, state: vc_state;

begin

--buffer for the input from the sprite register

L1: process(clk, reset) 	
begin
	if(clk'event and clk = '1') then
		if (reset = '1') then
			pixel_arr_buffer <= (others => '0');
			colour_buffer <= (others => '0');
		else
			pixel_arr_buffer <= new_pixel_arr_buffer;
			colour_buffer <= new_colour_buffer;
		end if;
	end if;
end process;

newarray_buffer: process(pixel_arr_buffer, pixel_array, done0, done4, waiting)
begin
	if (waiting ='1' ) then
		new_pixel_arr_buffer(7 downto 0)<=pixel_array(7 downto 0);
	elsif (done0 = '1') then 
		new_pixel_arr_buffer(3 downto 0)<=pixel_array(3 downto 0);
		new_pixel_arr_buffer(7 downto 4)<= pixel_arr_buffer(7 downto 4);
	elsif (done4 = '1') then
		new_pixel_arr_buffer(7 downto 4)<=pixel_array(7 downto 4);
		new_pixel_arr_buffer(3 downto 0)<= pixel_arr_buffer(3 downto 0);
	else
		new_pixel_arr_buffer<= pixel_arr_buffer;
	end if;
end process;

newcolour_buffer: process(sprite_colour, colour_buffer, done7)
begin
	if( done7 = '1') then
		new_colour_buffer<=sprite_colour;
	else 
		new_colour_buffer <= colour_buffer;
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

lb12: process(sync, cell_type, colour_buffer, pixel_array, state, county, current_block_horizontal, current_block_vertical, dual_pixel_y, pixel_arr_buffer)
begin
case state is
	when reset_state  =>
		waiting <= '1';
		done0 <= '0';
		done4 <= '0';
		done7 <= '1';

		reset_dual_pixel_y<='1';
		reset_current_block_horizontal <= '1';
		reset_current_block_vertical <= '1';
		reset_county<='1';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';
		en_dual_pixel_y <= '0';

		colour<="000";

		xcoordinates <= "00000";
		ycoordinates <= "00000";
		sprite_type<=cell_type;
		y_pos <= county;
		new_state<=wait_state;

	when wait_state  =>
		waiting <= '1';
		done0 <= '0';
		done4 <= '0';
		done7 <= '1';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_current_block_vertical <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';
		en_dual_pixel_y <= '0';

		colour<="000";

		xcoordinates <= current_block_horizontal;
		ycoordinates <= current_block_vertical;
		sprite_type<=cell_type;
		y_pos <= county;
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

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_current_block_vertical <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';
		en_dual_pixel_y <= '0';

		colour(0) <= ( colour_buffer(0) AND pixel_arr_buffer(7));
		colour(1) <= ( colour_buffer(1) AND pixel_arr_buffer(7));
		colour(2) <= ( colour_buffer(2) AND pixel_arr_buffer(7));

		xcoordinates <= current_block_horizontal;
		ycoordinates <= current_block_vertical;
		sprite_type<=cell_type;
		y_pos <= county;
		new_state<=pixel_1;

	when pixel_1 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_current_block_vertical <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '1';
		en_current_block_vertical <= '0';
		en_dual_pixel_y <= '0';

		colour(0) <= ( colour_buffer(0) AND pixel_arr_buffer(6));
		colour(1) <= ( colour_buffer(1) AND pixel_arr_buffer(6));
		colour(2) <= ( colour_buffer(2) AND pixel_arr_buffer(6));

		xcoordinates <= current_block_horizontal;
		ycoordinates <= current_block_vertical;
		sprite_type<=cell_type;
		y_pos <= county;
		new_state<=pixel_2;

	when pixel_2 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_current_block_vertical <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';
		en_dual_pixel_y <= '0';


		colour(0) <= ( colour_buffer(0) AND pixel_arr_buffer(5));
		colour(1) <= ( colour_buffer(1) AND pixel_arr_buffer(5));
		colour(2) <= ( colour_buffer(2) AND pixel_arr_buffer(5));

		xcoordinates <= current_block_horizontal;
		ycoordinates <= current_block_vertical;
		sprite_type <= cell_type;
		y_pos <= county;
		new_state <= pixel_3;

	when pixel_3 =>	
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_current_block_vertical <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';
		en_dual_pixel_y <= '0';

		colour(0) <= ( colour_buffer(0) AND pixel_arr_buffer(4));
		colour(1) <= ( colour_buffer(1) AND pixel_arr_buffer(4));
		colour(2) <= ( colour_buffer(2) AND pixel_arr_buffer(4));

		xcoordinates <= current_block_horizontal;
		ycoordinates <= current_block_vertical;
		sprite_type <= cell_type;
		y_pos <= county;
		new_state <= pixel_4;

	when pixel_4 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '1';
		done7 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_current_block_vertical <= '0';
		reset_county <= '0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';
		en_dual_pixel_y <= '0';


		colour(0) <= ( colour_buffer(0) AND pixel_arr_buffer(3));
		colour(1) <= ( colour_buffer(1) AND pixel_arr_buffer(3));
		colour(2) <= ( colour_buffer(2) AND pixel_arr_buffer(3));

		xcoordinates <= current_block_horizontal;
		ycoordinates <= current_block_vertical;
		sprite_type <= cell_type;
		y_pos <= county;
		new_state <= pixel_5; 

	when pixel_5 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';		

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_current_block_vertical <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';
		en_dual_pixel_y <= '0';


		colour(0) <= ( colour_buffer(0) AND pixel_arr_buffer(2));
		colour(1) <= ( colour_buffer(1) AND pixel_arr_buffer(2));
		colour(2) <= ( colour_buffer(2) AND pixel_arr_buffer(2));

		xcoordinates <= current_block_horizontal;
		ycoordinates <= current_block_vertical;
		sprite_type <= cell_type;
		y_pos <= county;
		new_state<=pixel_6; 

	when pixel_6 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';		

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_current_block_vertical <= '0';
		reset_county<='0';
		
		en_dual_pixel_y<='0';						
		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';

		colour(0) <= ( colour_buffer(0) AND pixel_arr_buffer(1));
		colour(1) <= ( colour_buffer(1) AND pixel_arr_buffer(1));
		colour(2) <= ( colour_buffer(2) AND pixel_arr_buffer(1));

		xcoordinates <= current_block_horizontal;
		ycoordinates <= current_block_vertical;
		sprite_type<=cell_type;
		y_pos <= county;
		new_state<=pixel_7; 

	when pixel_7 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '1';

		colour(0) <= ( colour_buffer(0) AND pixel_arr_buffer(0));
		colour(1) <= ( colour_buffer(1) AND pixel_arr_buffer(0));
		colour(2) <= ( colour_buffer(2) AND pixel_arr_buffer(0));

		xcoordinates <= current_block_horizontal;
		ycoordinates <= current_block_vertical;
		sprite_type <= cell_type;
		y_pos <= county;

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_current_block_vertical <= '0';
		reset_county<='0';
		
		en_dual_pixel_y<='0';						
		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';

		if current_block_horizontal >= "11000" then
			reset_current_block_horizontal <= '1';
			new_state<=wait_state;
			if county = "111" AND dual_pixel_y= '1' then
				reset_county <= '1';
				reset_dual_pixel_y<='1';
				if current_block_vertical >= "10111" then
					reset_current_block_vertical <= '1';
				else
						en_current_block_vertical<='1';
				end if;
			else 
				if dual_pixel_y = '1' then
					en_county<='1';
					reset_dual_pixel_y<='1';
				else 
					en_dual_pixel_y<='1';
				end if;
			end if;
		else
			new_state<= pixel_0;
		end if;
	when others =>
		waiting <= '0';
		done0 <= '0';
		done4 <= '0';
		done7 <= '0';

		reset_dual_pixel_y<='1';
		reset_current_block_horizontal <= '1';
		reset_current_block_vertical <= '1';
		reset_county<='1';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_current_block_vertical <= '0';
		en_dual_pixel_y <= '0';

		colour<="000";

		xcoordinates <= "00000";
		ycoordinates <= "00000";
		sprite_type<=cell_type;
		y_pos <= county;
		new_state<=reset_state;

	end case;
end process;		
end behaviour;
