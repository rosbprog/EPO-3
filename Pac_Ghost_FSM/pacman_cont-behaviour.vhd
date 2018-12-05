library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of pacman_cont is

type pac_state is		    ( 		reset_state,
				start_state,
				rip_state,
				wall_state,
				move_state);
	signal state, new_state:	pac_state;
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

	process (state, p_start, pos_is_wall, sadness)
	begin 
		case state is
			when reset_state =>
			p_ready <= '0';
			write_coin <= '0';
			en_wall <= '0';
			rip <= '0';
			en_cor <= '0';
				if (p_start = '1') then
					new_state <= start_state;
				else
					new_state <= reset_state;
				end if;

			when start_state =>
			p_ready <= '0';
			write_coin <= '0';
			en_wall <= '1';
			rip <= '0';
			en_cor <= '0';
				if (pos_is_wall = '0' and sadness = '0') then
					new_state <= move_state;
				elsif (pos_is_wall = '1' and sadness = '0') then
					new_state <= wall_state;
				elsif (sadness = '1') then
					new_state <= rip_state;
				else 
					new_state <= start_state;
				end if;

			when rip_state =>
			p_ready <= '1';
			write_coin <= '0';
			en_wall <= '0';
			rip <= '1';
			en_cor <= '0';
			new_state <= reset_state;

			when wall_state =>
			p_ready <= '1';
			write_coin <= '0';
			en_wall <= '0';
			rip <= '0';
			en_cor <= '0';
			new_state <= reset_state;

			when move_state =>
			p_ready <= '1';
			write_coin <= '1';
			en_wall <= '0';
			rip <= '0';
			en_cor <= '1';
			new_state <= reset_state;
		end case;
	end process;





end behaviour;

