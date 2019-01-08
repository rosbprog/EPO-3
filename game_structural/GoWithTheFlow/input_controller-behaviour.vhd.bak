architecture behavioural of input_controller is
	type	movement is (start_s, right_s, left_s, up_s, down_s);--s from state 
	signal 	state, new_state : movement;
begin
	process(clk, reset)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				state <= start_s;
			else
				state <= new_state;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		case state is
			when start_s =>
				move_out <= "0000";
				if (move_in = "0001") then
					new_state <= right_s;
				elsif (move_in = "0010") then
					new_state <= up_s;
				elsif (move_in = "0100") then
					new_state <= left_s;
				elsif (move_in = "1000") then
					new_state <= down_s;
				else
					new_state <= start_s;
				end if; 

			when right_s =>
				move_out <= "0001";
				if (move_in = "0010") then
					new_state <= up_s;
				elsif (move_in = "0100") then
					new_state <= left_s;
				elsif (move_in = "1000") then
					new_state <= down_s;
				else
					new_state <= right_s;
				end if; 

			when up_s =>
				move_out <= "0010";
				if (move_in = "0001") then
					new_state <= right_s;
				elsif (move_in = "0100") then
					new_state <= left_s;
				elsif (move_in = "1000") then
					new_state <= down_s;
				else
					new_state <= up_s;
				end if; 
	
			when left_s =>
				move_out <= "0100";
				if (move_in = "0001") then
					new_state <= right_s;
				elsif (move_in = "0010") then
					new_state <= up_s;
				elsif (move_in = "1000") then
					new_state <= down_s;
				else
					new_state <= left_s;
				end if; 
					 
			when down_s =>
				move_out <= "1000";
				if (move_in = "0001") then
					new_state <= right_s;
				elsif (move_in = "0010") then
					new_state <= up_s;
				elsif (move_in = "0100") then
					new_state <= left_s;
				else
					new_state <= down_s;
				end if; 
			
			when others =>
				new_state <= start_s;
		
		end case;
	end process;
end behavioural;
