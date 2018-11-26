library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of shift_control is

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
lb12: process(state, xcoordinates, ycoordinates, cell_state_in, y_pos_in, pixe_arr_in, pacman_pos_x, pacman_pos_y)

begin

case state is
	when reset_state =>
		pacman_pos_x_new <= "00000";
		pacman_pos_y_new <= "00000";
		pacman_pos_load <= '0';
		pacman_pos_reset <= '1';
		shift_clock_reset <= '1';
		cell_state_out<=cell_state_in;
		y_pos_out<=y_pos_in;
		pixel_arr_out<=pixel_arr_in;	
		new_state<= wait_state;
	when wait_state =>
		pacman_pos_x_new <= "00000";
		pacman_pos_y_new <= "00000";
		pacman_pos_load <= '0';
		pacman_pos_reset <= '0';
		shift_clock_reset <= '1';
		cell_state_out<=cell_state_in;
		y_pos_out<=y_pos_in;
		pixel_arr_out<=pixel_arr_in;
		
		if cell_state = "011" then	
			if xcoordinates = pacman_pos_x AND ycoordinates = pacman_pos_y then
				new_state <= buffer_state;
-- buffer state because coordinates are changed before cell_state, meaning that it will uncorrectly go to right shift if coordinates are incremented					
			elsif xcoordinates = pacman_pos_x + 1 AND ycoordinates = pacman_pos_y then
				pacman_pos_x_new<=xcoordinates;
				pacman_pos_y_new<=ycoordinates;
				pacman_pos_load<='1';
				shift_clock_reset <= '0';
				new_state <= right_shift_0;
			elsif xcoordinates = pacman_pos_x - 1 AND ycoordinates = pacman_pos_y then
				pacman_pos_x_new<=xcoordinates;
				pacman_pos_y_new<=ycoordinates;
				pacman_pos_load<='1';
				shift_clock_reset <= '0';
				new_state <= left_shift_0;
			elsif xcoordinates = pacman_pos_x  AND ycoordinates = pacman_pos_y + 1 then
				pacman_pos_x_new<=xcoordinates;
				pacman_pos_y_new<=ycoordinates;
				pacman_pos_load<='1';
				shift_clock_reset <= '0';
				new_state <= up_shift_0;
			elsif xcoordinates = pacman_pos_x  AND ycoordinates = pacman_pos_y + 1 then
				pacman_pos_x_new<=xcoordinates;
				pacman_pos_y_new<=ycoordinates;
				pacman_pos_load<='1';
				shift_clock_reset <= '0';
				new_state <= down_shift_0;
			else 
				pacman_pos_x_new<=xcoordinates;
				pacman_pos_y_new<=ycoordinates;
				pacman_pos_load<='1';
				new_state <= buffer_state;
			end if;
		else
			new_state<=wait_state;
		end if;
	
	when buffer_state =>
		pacman_pos_x_new <= "00000";
		pacman_pos_y_new <= "00000";
		pacman_pos_load <= '0';
		pacman_pos_reset <= '0';
		y_pos_out<=y_pos_in;
		pixel_arr_out<=pixel_arr_in;
		cell_state_out<=cell_state_in;
		if screen_sync = '1' then
			new_state <= wait_state;
		else
			new_state<= buffer_state;
		end if;

	when right_shift_0 then =>
		pacman_pos_x_new <= "00000";
		pacman_pos_y_new <= "00000";
		pacman_pos_load <= '0';
		pacman_pos_reset <= '0';
		shift_clock_reset <= '0';
		cell_state_out<=cell_state_in;
		y_pos_out<=y_pos_in;
		pixel_arr_out<=pixel_arr_in;
		

				
				
	
end behaviour;

