library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of gameover_control is

signal waiting, done0, done4, reset_row, en_row: std_logic;
signal row, new_row: std_logic;
signal pixel_arr_buffer, new_pixel_arr_buffer: std_logic_vector(7 downto 0);

signal go_type, new_go_type, score_a, score_b, score_c: std_logic_vector(4 downto 0);

type score_state is(reset_state, wait_state, pixel_0,pixel_1,pixel_2,pixel_3,pixel_4,pixel_5,pixel_6,pixel_7);
signal new_state, state: score_state;

begin
score_a <= '0' & score(3 downto 0);
score_b <= '0' & score(7 downto 4);
score_c <= '0' & score(11 downto 8);


L1: process(clk, reset) 	
begin
	if(clk'event and clk = '1') then
		if (reset = '1') then
			pixel_arr_buffer <= (others => '0');
		else
			pixel_arr_buffer <= new_pixel_arr_buffer;
		end if;
	end if;
end process;

Lcount: process(clk, reset) 	
begin
	if(clk'event and clk = '1') then
		if (reset_row = '1') then
			row <= '0';
		else
			row <= new_row;
		end if;
	end if;
end process;

Lcount2: process(en_row,row) 	
begin
	if(en_row='1') then
		new_row <= '1';
	else
		new_row <= row;
	end if;
end process;

L12: process(pixel_arr_buffer, pixel_array, done0, done4, waiting)
begin
	if (waiting ='1' ) then
		new_pixel_arr_buffer(7 downto 0)<=pixel_array(7 downto 0);
	elsif (done0 = '1') then 
		new_pixel_arr_buffer(7 downto 4)<=pixel_array(7 downto 4);
		new_pixel_arr_buffer(3 downto 0)<= pixel_arr_buffer(3 downto 0);
	elsif (done4 = '1') then
		new_pixel_arr_buffer(3 downto 0)<=pixel_array(3 downto 0);
		new_pixel_arr_buffer(7 downto 4)<= pixel_arr_buffer(7 downto 4);
	else
		new_pixel_arr_buffer<= pixel_arr_buffer;
	end if;
end process;

L2: process(clk, reset) 	
begin
	if(clk'event and clk = '1') then
		if (reset = '1') then
			go_type <= (others => '0');
		else
			go_type<= new_go_type;
		end if;
	end if;
end process;

L21: process(score_a, score_b, score_c, current_block_horizontal, row, start_go_sel)
begin
	case current_block_horizontal is
		when "01000" => 
			if(start_go_sel='0')then
				if (row='0') then
				new_go_type <=  "10101";
				else
				new_go_type <=  "10101";
				end if;			
			else
				if (row='0') then
				new_go_type <=  "10000";--g
				else
				new_go_type <=  "01010";
				end if;
			end if;
		when "01001" =>
			if(start_go_sel='0')then
				if (row='0') then
				new_go_type <=  "10110";
				else
				new_go_type <=  "10101";
				end if;				
			else
				if (row='0') then
				new_go_type <=  "10001";--a
				else
				new_go_type <=  "01011";
				end if;
			end if;
		when "01010" =>
			if(start_go_sel='0')then
				if (row='0') then
				new_go_type <=  "10001";
				else
				new_go_type <=  "01010";
				end if;				
			else
				if (row='0') then
				new_go_type <=  "10010";--m
				else
				new_go_type <=  "00000";
				end if;
			end if;
		when "01011" =>
			if(start_go_sel='0')then
				if (row='0') then
				new_go_type <=  "10111";
				else
				new_go_type <=  "10011";
				end if;				
			else
				if (row='0') then
				new_go_type <=  "01110";--e
				else
				new_go_type <=  "01101";
				end if;
			end if;
		when "01100" =>
			if(start_go_sel='0')then
				if (row='0') then
				new_go_type <=  "11000";
				else
				new_go_type <=  "10001";
				end if;				
			else
				if (row='0') then
				new_go_type <=  "10101";--
				else
				new_go_type <=  "01110";
				end if;
			end if;
		when "01101" =>
			if(start_go_sel='0')then
				if (row='0') then
				new_go_type <=  "10010";
				else
				new_go_type <=  "01101";
				end if;				
			else
				if (row='0') then
				new_go_type <=  "00000";--o
				else
				new_go_type <=  "01111";
				end if;
			end if;
		when "01110" =>
			if(start_go_sel='0')then
				if (row='0') then
				new_go_type <=  "10001";
				else
				new_go_type <=  "10011";
				end if;				
			else
				if (row='0') then
				new_go_type <=  "10100";--v
				else
				new_go_type <=  score_c;
				end if;
			end if;
		when "01111" =>		
			if(start_go_sel='0')then
				if (row='0') then
				new_go_type <=  "10111";
				else
				new_go_type <=  "10101";
				end if;				
			else	
				if (row='0') then
				new_go_type <=  "01110";--e
				else
				new_go_type <=  score_b;
				end if;
			end if;
		when "10000" =>
			if(start_go_sel='0')then
				if (row='0') then
				new_go_type <=  "10101";
				else
				new_go_type <=  "10101";
				end if;				
			else
				if (row='0') then
				new_go_type <=  "01101";--r
				else
				new_go_type <=  score_a;
				end if;
			end if;
		when others =>
				new_go_type <=  "10101";
	end case;
end process;


L3: process(clk, reset)
begin
	if(clk'event and clk = '1') then
		if reset = '1' then
			state<= reset_state;
		else
			state<= new_state;
		end if;
	end if;
end process;

L31: process(gameover_sync_vga, go_type, pixel_array, state, county, current_block_horizontal, dual_pixel_y, pixel_arr_buffer, row)
begin
case state is
	when reset_state  =>
		waiting <= '1';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='1';
		reset_current_block_horizontal <= '1';
		reset_county<='1';
                reset_row<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';
		en_row<='0';

		go_sprite_type <= go_type;
		go_y_pos <= county;

	
		go_colour(0) <= '0';
		go_colour(1) <= '0';
		go_colour(2) <= '0';
		new_state <= wait_state;

	when wait_state  =>
		waiting <= '1';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		reset_row<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';
		en_row<='0';

		go_sprite_type <= go_type;
		go_y_pos <= county;

		go_colour(0) <= '0';
		go_colour(1) <= '0';
		go_colour(2) <= '0';

		if gameover_sync_vga='1' then
			new_state <= pixel_0;
		else
			new_state<=wait_state;
		end if;

	when  pixel_0  =>	
		waiting<='0';
		done0 <= '1';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		reset_row<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';
		en_row<='0';

     		if (row='0' AND start_go_sel='1') then
		go_colour(0) <= ('1' and pixel_arr_buffer(7));
		go_colour(1) <= '0';
		go_colour(2) <= '0';
		else
		go_colour(0) <= ('1' and pixel_arr_buffer(7));
		go_colour(1) <= ('1' and pixel_arr_buffer(7));
		go_colour(2) <= '0';
		end if;

		go_sprite_type <= go_type;
		go_y_pos <= county;
		new_state<=pixel_1;

	when pixel_1 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		reset_row<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';
		en_row<='0';

     		if (row='0' AND start_go_sel='1') then
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= '0';
		colour(2) <= '0';
		else
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= ('1' and pixel_arr_buffer(7));
		colour(2) <= '0';
		end if;

		go_sprite_type <= go_type;
		go_y_pos <= county;
		new_state<=pixel_2;

	when pixel_2 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		reset_row<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';
		en_row<='0';

     		if (row='0' AND start_go_sel='1') then
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= '0';
		colour(2) <= '0';
		else
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= ('1' and pixel_arr_buffer(7));
		colour(2) <= '0';
		end if;

		go_sprite_type <= go_type;
		go_y_pos <= county;
		new_state <= pixel_3;

	when pixel_3 =>	
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		reset_row<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';
		en_row<='0';

     		if (row='0' AND start_go_sel='1') then
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= '0';
		colour(2) <= '0';
		else
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= ('1' and pixel_arr_buffer(7));
		colour(2) <= '0';
		end if;

		go_sprite_type <= go_type;
		go_y_pos <= county;
		new_state <= pixel_4;

	when pixel_4 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '1';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county <= '0';
		reset_row<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';
		en_row<='0';

     		if (row='0' AND start_go_sel='1') then
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= '0';
		colour(2) <= '0';
		else
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= ('1' and pixel_arr_buffer(7));
		colour(2) <= '0';
		end if;

		go_sprite_type <= go_type;
		go_y_pos <= county;
		new_state <= pixel_5; 

	when pixel_5 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';	

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		reset_row<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';
		en_row<='0';

     		if (row='0' AND start_go_sel='1') then
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= '0';
		colour(2) <= '0';
		else
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= ('1' and pixel_arr_buffer(7));
		colour(2) <= '0';
		end if;

		go_sprite_type <= go_type;
		go_y_pos <= county;
		new_state<=pixel_6; 

	when pixel_6 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		reset_row<='0';
		
		en_dual_pixel_y<='0';						
		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_row<='0';

     		if (row='0' AND start_go_sel='1') then
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= '0';
		colour(2) <= '0';
		else
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= ('1' and pixel_arr_buffer(7));
		colour(2) <= '0';
		end if;

		go_sprite_type <= go_type;
		go_y_pos <= county;
		new_state<=pixel_7; 
	when pixel_7 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

     		if (row='0' AND start_go_sel='1') then
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= '0';
		colour(2) <= '0';
		else
		colour(0) <= ('1' and pixel_arr_buffer(7));
		colour(1) <= ('1' and pixel_arr_buffer(7));
		colour(2) <= '0';
		end if;

		go_sprite_type <= go_type;
		go_y_pos <= county;

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		reset_row<='0';
		
		en_dual_pixel_y<='0';						
		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_row<='0';

		if current_block_horizontal >= "10111" then
			reset_current_block_horizontal <= '1';
			new_state<=wait_state;
			if county = "111" AND dual_pixel_y= '1' then
				reset_county <= '1';
				reset_dual_pixel_y <= '1';
				if (row='0') then
					en_row<='1';
				else
					reset_row<='1';
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
			en_current_block_horizontal <= '1';
			new_state<= pixel_0;
		end if;
	when others =>
		waiting <= '0';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='1';
		reset_current_block_horizontal <= '1';
		reset_county<='1';
		reset_row <= '1';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';
		en_row<='0';

		go_sprite_type <= go_type;
		go_y_pos <= county;
		colour(0) <= '0';
		colour(1) <= '0';
		colour(2) <= '0';
		new_state <= reset_state;

	end case;
end process;		
end behaviour;





