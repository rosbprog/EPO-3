library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behavioural of screen_controller is

type statetype is (start_state, game_state, pre_game_over_state, game_over_state);
signal state,next_state : statetype;
signal go, new_go, reset_go,en_go,switch_screen_reset_in: std_logic;

begin

l1234: process(clk, reset_go)
begin
	if(clk'event and clk = '1') then
		if (reset_go = '1') then
			go <= '0';
		else
			go <= new_go;
		end if;
	end if;
end process;

go2: process(en_go,go) 	
begin
	if(en_go='1') then
		new_go <= '1';
	else
		new_go <= go;
	end if;
end process;

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
        reset_go<='1';
	en_go<='0'
		  
        if (user = '1' and calc_start_in='1') then
          next_state <= game_state;
	  switch_screen_reset_in<='1';
        else
          next_state <= start_state;
	  switch_screen_reset_in<='0';
        end if;
		
      when game_state =>
        mux_sel     <= '1';
        st_go_sel   <= '0';
	reset_go<='0';
	switch_screen_reset_in<='0';
	
        if (game_over = '1') then
          next_state <= pre_game_over_state;
	  en_go<='1';
        else
          next_state <= game_state;
	  en_go<='0';
        end if;
		
      when pre_game_over_state =>
	mux_sel<= '0';
        st_go_sel<= '0';
	reset_go<='0';
	en_go<='0';

 	if (go = '1' and calc_start_in='1') then
          next_state <= game_over_state;
	  switch_screen_reset_in<='1';
        else
          next_state <= pre_game_over_state;
	  switch_screen_reset_in<='0';
        end if;			
	
      when game_over_state =>
        mux_sel     <= '0';
        st_go_sel   <= '1';
	reset_go<='1';
	en_go<='0';

        if (user = '1' and calc_start_in='1') then
          next_state <= game_state;
	  switch_screen_reset_in<='1';
        else
          next_state <= game_over_state;
	  switch_screen_reset_in<='0';
        end if;
    end case;
  end process;

	 switch_screen_reset<=switch_screen_reset_in;
end architecture behavioural;
