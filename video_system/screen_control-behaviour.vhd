library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behavioural of screen_controller is

type statetype is (start_state, game_state, game_over_state);
signal state,next_state : statetype;

begin
	pr_1: process (clk, reset)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				state <= start_state;
			else
				state <= next_state;
			end if;
		end if;
	end process;

	pr_2: process(state, user, game_over) is
	begin
		case state is
		  when start_state =>
        mux_sel     <= '0';
        st_go_sel   <= '0';

        if (user = '1') then
          next_state <= game_state;
        else
          next_state <= start_state;
        end if;
      when game_state =>
        mux_sel     <= '1';
        st_go_sel   <= '0';

        if (game_over = '1') then
          next_state <= game_over_state;
        else
          next_state <= game_state;
        end if;

      when game_over_state =>
        mux_sel     <= '0';
        st_go_sel   <= '1';

        if (user = '1') then
          next_state <= game_state;
        else
          next_state <= game_over_state;
        end if;
    end case;
  end process;

end architecture behavioural;
