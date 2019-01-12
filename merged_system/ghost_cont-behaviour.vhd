library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of ghost_cont is

	type ghost_state is		    ( reset_state,
				start_state,
				no_wall_state,
				wall_state);
	signal state, new_state:	ghost_state;
begin
	process
	begin
		wait until(rising_edge(clk));
			if(reset = '1') then
				state <= reset_state;
			else
				state <= new_state;
			end if;
	end process;

	process (state, ghost_start, pos_is_wall)
	begin
		case state is
			when reset_state => --this states waites till vga is ready
			en_cor_ghost <=  '0';
			ghost_ready <=  '0';
			en_wall <=  '0';	
				if (ghost_start = '1') then 
					new_state <= start_state;
				else
					new_state <= reset_state;
				end if;

			when start_state => --this states checks to see what to do next
			en_cor_ghost <=  '0';
			ghost_ready <=  '0';
			en_wall <= '1';	
				if (pos_is_wall =  '1') then 
					new_state <= wall_state;
				elsif (pos_is_wall =  '0') then
					new_state <= no_wall_state;
				else
					new_state <= start_state;
				end if;

			when wall_state => -- oh no! there is a wall
			en_cor_ghost <=  '0';
			ghost_ready <=  '1';
			en_wall <=  '0';	
			new_state <= reset_state;

			when no_wall_state => -- yay there is no wall
			en_cor_ghost <=  '1';
			ghost_ready <=  '1';
			en_wall <=  '0';	
			new_state <= reset_state;
		end case;
	end process;
end behaviour;
