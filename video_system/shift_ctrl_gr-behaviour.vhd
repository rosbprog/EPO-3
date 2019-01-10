library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

architecture behaviour of shift_ctrl_gr is

type shift_control_state is(reset_state, wait_state, buffer_state,
left_shift_1, left_shift_2, left_shift_3, left_shift_4, left_shift_5, left_shift_6, left_shift_7,
right_shift_1, right_shift_2, right_shift_3, right_shift_4, right_shift_5, right_shift_6, right_shift_7,
up_shift_1, up_shift_2, up_shift_3, up_shift_4, up_shift_5, up_shift_6, up_shift_7, 
down_shift_1, down_shift_2, down_shift_3, down_shift_4, down_shift_5, down_shift_6, down_shift_7); 
signal state, new_state: shift_control_state;

begin

lb11: process(clk, reset)
begin
	if(clk'event and clk = '1') then
		if reset = '1' then
			state<= reset_state;
		else
			state<= new_state;
		end if;
	end if;
end process;
lb12: process(state, xcoordinates, ycoordinates, cell_state_in, y_pos_in, pixel_arr_in, gr_pos_x, gr_pos_y, screen_sync, shift_pulse)

begin

case state is
	when reset_state =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '1';
		shift_gr_clock_reset <= '1';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;	
		new_state<= wait_state;
	when wait_state =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '1';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if cell_state_in = "010" then	
			--if (xcoordinates = gr_pos_x) AND (ycoordinates = gr_pos_y) then
			--	new_state <= buffer_state;
-- buffer state because coordinates are changed before cell_state, meaning that it will uncorrectly go to right shift if coordinates are incremented					

-- compares current gr position with new gr position, thus determining the shift direction.
			if (xcoordinates = gr_pos_x + 1) AND (ycoordinates = gr_pos_y) then
				gr_pos_x_new<=xcoordinates;
				gr_pos_y_new<=ycoordinates;
				gr_pos_load<='1';
				shift_gr_clock_reset <= '0';
				new_state <= right_shift_1;
			elsif (xcoordinates = gr_pos_x - 1) AND (ycoordinates = gr_pos_y)then
				gr_pos_x_new<=xcoordinates;
				gr_pos_y_new<=ycoordinates;
				gr_pos_load<='1';
				shift_gr_clock_reset <= '0';
				new_state <= left_shift_1;
			elsif (xcoordinates = gr_pos_x ) AND (ycoordinates = gr_pos_y - 1) then
				gr_pos_x_new<=xcoordinates;
				gr_pos_y_new<=ycoordinates;
				gr_pos_load<='1';
				shift_gr_clock_reset <= '0';
				new_state <= up_shift_1;
			elsif (xcoordinates = gr_pos_x)  AND (ycoordinates = gr_pos_y + 1) then
				gr_pos_x_new<=xcoordinates;
				gr_pos_y_new<=ycoordinates;
				gr_pos_load<='1';
				shift_gr_clock_reset <= '0';
				new_state <= down_shift_1;
			else 
				gr_pos_x_new<=xcoordinates;
				gr_pos_y_new<=ycoordinates;
				gr_pos_load<='1';
				new_state <= wait_state;
			end if;
		else
			new_state<=wait_state;
		end if;
	
	when buffer_state =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset<='1';
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		cell_state_out_gr<=cell_state_in;
		if screen_sync = '1' then
			new_state <= wait_state;
		else
			new_state<= buffer_state;
		end if;

-- for the right shift

	when right_shift_1 =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

-- gr shifted to the right, so for xcoordinates = gr_pos_x - 1, that block should have gr shifted to the right

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x - 1) then		--shift to the right when at the previous block
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ('0' & pixel_arr_in(7 downto 1));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then			-- shift tot the left when at the new block
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(0) & "0000000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=right_shift_2;
		else
			new_state<=right_shift_1;
		end if;

-- repeat this for each pixel 

	when right_shift_2 =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x - 1) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("00" & pixel_arr_in(7 downto 2));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(1 downto 0) & "000000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=right_shift_3;
		else
			new_state<=right_shift_2;
		end if;
	when right_shift_3 =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x - 1) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("000" & pixel_arr_in(7 downto 3));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(2 downto 0) & "00000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=right_shift_4;
		else
			new_state<=right_shift_3;
		end if;

	when right_shift_4  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x - 1) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("0000" & pixel_arr_in(7 downto 4));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(3 downto 0) & "0000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=right_shift_5;
		else
			new_state<=right_shift_4;
		end if;
	when right_shift_5  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x - 1) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("00000" & pixel_arr_in(7 downto 5));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(4 downto 0) & "000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=right_shift_6;
		else
			new_state<=right_shift_5;
		end if;
	when right_shift_6  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x - 1) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("000000" & pixel_arr_in(7 downto 6));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(5 downto 0) & "00");
		end if;
			
		if shift_pulse = '1' then
			new_state<=right_shift_7;
		else
			new_state<=right_shift_6;
		end if;
	when right_shift_7  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x - 1) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("0000000" & pixel_arr_in(7));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(6 downto 0) & "0");
		end if;
			
		if shift_pulse = '1' then
			new_state<=wait_state;
		else
			new_state<=right_shift_7;
		end if;


------------------------------------------------------------------ left shift
	when left_shift_1  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

-- gr shifted to the left, so for xcoordinates = gr_pos_x + 1, that block should have gr shifted to the left

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then		--shift to the right when at the new block
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("0000000" & pixel_arr_in(7));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x + 1) then			-- shift tot the left when at the previous block
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(6 downto 0) & "0");
		end if;
			
		if shift_pulse = '1' then
			new_state<=left_shift_2;
		else
			new_state<=left_shift_1;
		end if;

-- repeat this for each pixel 

	when left_shift_2  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("000000" & pixel_arr_in(7 downto 6));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x + 1) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(5 downto 0) & "00");
		end if;
			
		if shift_pulse = '1' then
			new_state<=left_shift_3;
		else
			new_state<=left_shift_2;
		end if;

	when left_shift_3  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("00000" & pixel_arr_in(7 downto 5));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x + 1) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(4 downto 0) & "000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=left_shift_4;
		else
			new_state<=left_shift_3;
		end if;

	when left_shift_4  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("0000" & pixel_arr_in(7 downto 4));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x + 1) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(3 downto 0) & "0000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=left_shift_5;
		else
			new_state<=left_shift_4;
		end if;		
		
	when left_shift_5  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("000" & pixel_arr_in(7 downto 3));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x + 1) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(2 downto 0) & "00000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=left_shift_6;
		else
			new_state<=left_shift_5;
		end if;				

	when left_shift_6  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("00" & pixel_arr_in(7 downto 2));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x + 1) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(1 downto 0) & "000000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=left_shift_7;
		else
			new_state<=left_shift_6;
		end if;	

	when left_shift_7  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;

		if (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x) then		
			cell_state_out_gr<= "010" ;
			pixel_arr_out_gr <= ("0" & pixel_arr_in(7 downto 1));
		elsif (ycoordinates = gr_pos_y) AND (xcoordinates = gr_pos_x + 1) then			
			cell_state_out_gr<="010";
			pixel_arr_out_gr <= (pixel_arr_in(0) & "0000000");
		end if;
			
		if shift_pulse = '1' then
			new_state<=wait_state;
		else
			new_state<=left_shift_7;
		end if;	
--------------------- down shift	

-- for up and down shift, the same principle is used, but this time the y_select signal for the register is incremented or decremented


	when down_shift_1  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if (ycoordinates = gr_pos_y - 1) AND xcoordinates = gr_pos_x then 		-- previous block, so gr should be shifted downwards
			if y_pos_in <= "000" then 			-- if the y_pos is 0, this means that that specific row should be all zero's, because gr is shifted down. 
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 1;
			end if;
			cell_state_out_gr<= "010" ;
		elsif ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then
			if y_pos_in >= "001" then -- if the y_pos is 7, this means that that specific row should be all zero's, because gr is shifted up. 
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 7;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=down_shift_2;
		else
			new_state<=down_shift_1;
		end if;

	when down_shift_2 =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if (ycoordinates = gr_pos_y - 1) AND xcoordinates = gr_pos_x then 		-- previous block, so gr should be shifted downwards
			if y_pos_in <= "001" then 			-- if the y_pos is <= 1, this means that those specific rows should be all zero's, because gr is shifted down. 
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 2;
			end if;
			cell_state_out_gr<= "010" ;
		elsif ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then
			if y_pos_in >= "010" then -- if the y_pos >= 6, this means that those specific rows should be all zero's, because gr is shifted up. 
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 6;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=down_shift_3;
		else
			new_state<=down_shift_2;
		end if;

-- same principle for the other up shifts
	when down_shift_3  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if (ycoordinates = gr_pos_y - 1) AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "010" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 3;
			end if;
			cell_state_out_gr<= "010" ;
		elsif ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then
			if y_pos_in >= "011" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 5;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=down_shift_4;
		else
			new_state<=down_shift_3;
		end if;

	when down_shift_4  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if (ycoordinates = gr_pos_y - 1) AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "011" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 4;
			end if;
			cell_state_out_gr<= "010" ;
		elsif ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then
			if y_pos_in >= "100" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 4;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=down_shift_5;
		else
			new_state<=down_shift_4;
		end if;

	when down_shift_5  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if (ycoordinates = gr_pos_y - 1) AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "100" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 5;
			end if;
			cell_state_out_gr<= "010" ;
		elsif ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then
			if y_pos_in >= "101" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 3;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=down_shift_6;
		else
			new_state<=down_shift_5;
		end if;

	when down_shift_6  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if (ycoordinates = gr_pos_y - 1) AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "101" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 6;
			end if;
			cell_state_out_gr<= "010" ;
		elsif ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then
			if y_pos_in >= "110" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 2;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=down_shift_7;
		else
			new_state<=down_shift_6;
		end if;

	when down_shift_7  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if ycoordinates = gr_pos_y - 1 AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "110" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 7;
			end if;
			cell_state_out_gr<= "010" ;
		elsif (ycoordinates = gr_pos_y) AND xcoordinates = gr_pos_x then
			if y_pos_in >= "111" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 1;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=wait_state;
		else
			new_state<=down_shift_7;
		end if;

------------------ up shift

	when up_shift_1  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then 		-- current block, so gr should be shifted downwards
			if y_pos_in <= "110" then 			-- if the y_pos is 0, this means that that specific row should be all zero's, because gr is shifted down. 
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 7;
			end if;
			cell_state_out_gr<= "010" ;
		elsif (ycoordinates = gr_pos_y + 1) AND xcoordinates = gr_pos_x then  -- previous block, so gr should be shifted upwards
			if y_pos_in >= "111" then -- if the y_pos is 7, this means that that specific row should be all zero's, because gr is shifted up. 
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 1;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=up_shift_2;
		else
			new_state<=up_shift_1;
		end if;

	when up_shift_2  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then 		-- current block, so gr should be shifted downwards
			if y_pos_in <= "101" then 			-- if the y_pos is <= 1, this means that those specific rows should be all zero's, because gr is shifted down. 
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 6;
			end if;
			cell_state_out_gr<= "010" ;
		elsif (ycoordinates = gr_pos_y + 1) AND xcoordinates = gr_pos_x then  -- previous block, so gr should be shifted upwards
			if y_pos_in >= "110" then -- if the y_pos >= 6, this means that those specific rows should be all zero's, because gr is shifted up. 
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 2;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=up_shift_3;
		else
			new_state<=up_shift_2;
		end if;

-- same principle for the other down shifts
	when up_shift_3  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "100" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 5;
			end if;
			cell_state_out_gr<= "010" ;
		elsif (ycoordinates = gr_pos_y + 1) AND xcoordinates = gr_pos_x then
			if y_pos_in >= "101" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 3;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=up_shift_4;
		else
			new_state<=up_shift_3;
		end if;

	when up_shift_4  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "011" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 4;
			end if;
			cell_state_out_gr<= "010" ;
		elsif (ycoordinates = gr_pos_y + 1) AND xcoordinates = gr_pos_x then
			if y_pos_in >= "100" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 4;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=up_shift_5;
		else
			new_state<=up_shift_4;
		end if;

	when up_shift_5  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "010" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 3;
			end if;
			cell_state_out_gr<= "010" ;
		elsif (ycoordinates = gr_pos_y + 1) AND xcoordinates = gr_pos_x then
			if y_pos_in >= "011" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 5;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=up_shift_6;
		else
			new_state<=up_shift_5;
		end if;

	when up_shift_6  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "001" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 2;
			end if;
			cell_state_out_gr<= "010" ;
		elsif (ycoordinates = gr_pos_y + 1)  AND xcoordinates = gr_pos_x then
			if y_pos_in >= "010" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 6;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=up_shift_7;
		else
			new_state<=up_shift_6;
		end if;

	when up_shift_7  =>
		gr_pos_x_new <= "00000";
		gr_pos_y_new <= "00000";
		gr_pos_load <= '0';
		gr_pos_reset <= '0';
		shift_gr_clock_reset <= '0';
		cell_state_out_gr<=cell_state_in;
		y_pos_out_gr<=y_pos_in;
		pixel_arr_out_gr<=pixel_arr_in;
		
		if ycoordinates = gr_pos_y AND xcoordinates = gr_pos_x then 		
			if y_pos_in <= "000" then 			
				pixel_arr_out_gr<= "00000000";
			else 
				y_pos_out_gr <= y_pos_in - 1;
			end if;
			cell_state_out_gr<= "010" ;
		elsif (ycoordinates = gr_pos_y + 1) AND xcoordinates = gr_pos_x then
			if y_pos_in >= "001" then
				pixel_arr_out_gr<="00000000";
			else
				y_pos_out_gr <= y_pos_in + 7;
			end if;
			cell_state_out_gr<= "010" ;
		end if;

		if shift_pulse = '1' then
			new_state<=wait_state;
		else
			new_state<=up_shift_7;
		end if;
	end case;
end process;


end behaviour;

