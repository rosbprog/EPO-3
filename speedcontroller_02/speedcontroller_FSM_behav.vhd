architecture behavioural of fsm_counter is

	constant n1 : integer := 40;
 	constant n2 : integer := 60;
	constant n3 : integer := 80;
	constant n4 : integer := 120;

	type	name_state is (	reset_s, start_s, p_move_s, g1_move_s, g2_move_s, 
				reset_f, start_f, p_move, g1_move, g2_move,
				g1_move_f, g2_move_f, p_move_f,
				pause_1, pause_2, pause_3); 
	signal 	state, new_state : name_state;
begin
	process(clk, reset, coin_rst)
	begin
		if (rising_edge (clk)) then  --synchronous (two way)reset
			if (reset = '0' AND coin_rst = '1') then --pac man moves slow
				state <= reset_s;
			elsif (reset = '1') then		--pac man moves fast		
				state <= reset_f;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	process(p_rdy, g1_rdy, count)

	begin

		case state is

			when reset_s =>   		--begin left part fsm
				p_strt	<= '0';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '1';

				new_state <= start_s;

			when start_s =>
				p_strt	<= '0';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '0';

				if(p_rdy = '1' and g1_rdy = '0') then
					new_state <= g1_move_s;
				elsif(p_rdy = '0' and g1_rdy = '1') then
					new_state <= g2_move_s;
				elsif(p_rdy = '0' and g1_rdy = '0' and count=std_logic_vector(to_unsigned(n2, 7))) then
					new_state <= p_move_s;
				else
					new_state <= start_s;
				end if;	
				
			when p_move_s =>
				p_strt	<= '1';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '1';
	
				new_state <= start_s;
				--we can safely go back due to count reset
			when g1_move_s =>
				p_strt	<= '0';
				g1_strt	<= '1';
				g2_strt <= '0';
				c_rst	<= '0';
				
				new_state <= start_s;

			when g2_move_s =>
				p_strt	<= '0';
				g1_strt	<= '0';
				g2_strt <= '1';
				c_rst	<= '0';

				new_state <= start_s;

			when reset_f =>			--begin right part fsm
				p_strt	<= '0';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '1';
				
				new_state <= start_f;

			when start_f =>
				p_strt	<= '0';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '0';	

				if(p_rdy = '1' and g1_rdy = '0') then
					new_state <= g1_move;
				elsif(p_rdy = '0' and g1_rdy = '1') then
					new_state <= g2_move;
				elsif(p_rdy = '0' and g1_rdy = '0' and count=std_logic_vector(to_unsigned(n4, 7))) then
					new_state <= p_move;
				elsif(p_rdy = '0' and g1_rdy = '0' and count=std_logic_vector(to_unsigned(n2, 7))) then
					new_state <= g1_move_f;
				elsif(p_rdy = '0' and g1_rdy = '0' and (count=std_logic_vector(to_unsigned(n1, 7)) or count=std_logic_vector(to_unsigned(n3, 7)))) then
					new_state <= p_move_f;
				else
					new_state <= start_f;
				end if;
					
			when p_move =>
				p_strt	<= '1';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '1';
						
				new_state <= start_f;
				--we can safely go back due to count reset
			when g1_move =>
				p_strt	<= '0';
				g1_strt	<= '1';
				g2_strt <= '0';
				c_rst<= '0';

				new_state <= start_f;

			when g2_move =>
				p_strt	<= '0';
				g1_strt	<= '1';
				g2_strt <= '0';
				c_rst	<= '0';

				new_state <= start_f;

			when g1_move_f =>
				p_strt	<= '0';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '1';

				new_state <= pause_1;
		
			when g2_move_f=>
				p_strt	<= '0';
				g1_strt	<= '1';
				g2_strt <= '0';
				c_rst	<= '0';
			
				new_state <= pause_2;

			when p_move_f =>
				p_strt	<= '1';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '0';

				new_state <= pause_3;

			when pause_1 =>
				p_strt	<= '0';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '0';

				if(p_rdy = '0' and g1_rdy = '1') then
					new_state <= g2_move_f;
				else
					new_state <= pause_1;
				end if;

			when pause_2 =>
				p_strt	<= '0';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '0';

				if(p_rdy = '0' and g1_rdy = '0' and count > std_logic_vector(to_unsigned(n2, 7)))then
					new_state <= start_f;
				else
					new_state <= pause_2;
				end if;

			when pause_3 =>
				p_strt	<= '0';
				g1_strt	<= '0';
				g2_strt <= '0';
				c_rst	<= '0';
				if(p_rdy = '1' and g1_rdy = '0' and ( (count < std_logic_vector(to_unsigned(n3,7)) 
								and count > std_logic_vector(to_unsigned(n1,7))) 
								or (count < std_logic_vector(to_unsigned(n4,7)) 
								and count > std_logic_vector(to_unsigned(n3,7))))) then
					new_state <= start_f;
				else
					new_state <= pause_3;
				end if;
		end case;
	end process;
end behavioural;
