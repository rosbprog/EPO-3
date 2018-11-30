library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of score_control is

signal waiting, done0, done4: std_logic;

signal pixel_arr_buffer, new_pixel_arr_buffer: std_logic_vector(7 downto 0);

signal score_type, new_score_type: std_logic_vector(3 downto 0);

type score_state is(reset_state, wait_state, pixel_0,pixel_1,pixel_2,pixel_3,pixel_4,pixel_5,pixel_6,pixel_7);
signal new_state, state: score_state;

begin

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
			score_type <= (others => '0');
		else
			score_type<= new_score_type;
		end if;
	end if;
end process;

L21: process( score_a, score_b, score_c, current_block_horizontal)
begin
	case current_block_horizontal is
		when "01101" => 
			new_score_type <=  "1010";
		when "01110" =>
			new_score_type <=  "1011";
		when "01111" =>
			new_score_type <=  "0000";
		when "10000" =>
			new_score_type <=  "1101";
		when "10001" =>
			new_score_type <=  "1110";
		when "10010" =>
			new_score_type <=  "1111";
		when "10011" =>
			new_score_type <=  score_c;
		when "10100" =>
			new_score_type <=  score_b;
		when "10101" =>
			new_score_type <=  score_a;
		when others =>
			new_score_type <=  "1100";
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

L31: process(score_sync, score_type, pixel_array, state, county, current_block_horizontal, dual_pixel_y, pixel_arr_buffer)
begin
case state is
	when reset_state  =>
		waiting <= '1';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='1';
		reset_current_block_horizontal <= '1';
		reset_county<='1';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';

		score_sprite_type<=score_type;
		score_y_pos <= county;
		colour(0) <= '0';
		colour(1) <= '0';
		colour(2) <= '0';
		new_state <= wait_state;

	when wait_state  =>
		waiting <= '1';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';

		score_sprite_type<= score_type;
		score_y_pos <= county;
		colour(0) <= '0';
		colour(1) <= '0';
		colour(2) <= '0';
		if score_sync='1' then
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

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';

		colour(0) <= not(pixel_arr_buffer(0));
		colour(1) <= pixel_arr_buffer(0);
		colour(2) <= pixel_arr_buffer(0);

		score_sprite_type<= score_type;
		score_y_pos <= county;
		new_state<=pixel_1;

	when pixel_1 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';

		colour(0) <= not(pixel_arr_buffer(1));
		colour(1) <= pixel_arr_buffer(1);
		colour(2) <= pixel_arr_buffer(1);

		score_sprite_type<= score_type;
		score_y_pos <= county;
		new_state<=pixel_2;

	when pixel_2 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';


		colour(0) <= not(pixel_arr_buffer(2));
		colour(1) <= pixel_arr_buffer(2);
		colour(2) <= pixel_arr_buffer(2);

		score_sprite_type<= score_type;
		score_y_pos <= county;
		new_state <= pixel_3;

	when pixel_3 =>	
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';

		colour(0) <= not(pixel_arr_buffer(3));
		colour(1) <= pixel_arr_buffer(3);
		colour(2) <= pixel_arr_buffer(3);

		score_sprite_type<= score_type;
		score_y_pos <= county;
		new_state <= pixel_4;

	when pixel_4 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '1';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county <= '0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';


		colour(0) <= not(pixel_arr_buffer(4));
		colour(1) <= pixel_arr_buffer(4);
		colour(2) <= pixel_arr_buffer(4);

		score_sprite_type<= score_type;
		score_y_pos <= county;
		new_state <= pixel_5; 

	when pixel_5 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';	

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';


		colour(0) <= not(pixel_arr_buffer(5));
		colour(1) <= pixel_arr_buffer(5);
		colour(2) <= pixel_arr_buffer(5);

		score_sprite_type<= score_type;
		score_y_pos <= county;
		new_state<=pixel_6; 

	when pixel_6 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		
		en_dual_pixel_y<='0';						
		en_county <= '0';
		en_current_block_horizontal <= '0';

		colour(0) <= not(pixel_arr_buffer(6));
		colour(1) <= pixel_arr_buffer(6);
		colour(2) <= pixel_arr_buffer(6);

		score_sprite_type<= score_type;
		score_y_pos <= county;
		new_state<=pixel_7; 
	when pixel_7 =>		
		waiting<='0';
		done0 <= '0';
		done4 <= '0';

		colour(0) <= not(pixel_arr_buffer(7));
		colour(1) <= pixel_arr_buffer(7);
		colour(2) <= pixel_arr_buffer(7);

		score_sprite_type<= score_type;
		score_y_pos <= county;

		reset_dual_pixel_y<='0';
		reset_current_block_horizontal <= '0';
		reset_county<='0';
		
		en_dual_pixel_y<='0';						
		en_county <= '0';
		en_current_block_horizontal <= '0';

		if current_block_horizontal >= "10111" then
			reset_current_block_horizontal <= '1';
			new_state<=wait_state;
			if county = "111" AND dual_pixel_y= '1' then
				reset_county <= '1';
				reset_dual_pixel_y <= '1';
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

		en_county <= '0';
		en_current_block_horizontal <= '0';
		en_dual_pixel_y <= '0';

		score_sprite_type<=score_type;
		score_y_pos <= county;
		colour(0) <= '0';
		colour(1) <= '0';
		colour(2) <= '0';
		new_state <= reset_state;

	end case;
end process;		
end behaviour;

