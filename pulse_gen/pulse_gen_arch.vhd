architecture behavioural of pulse_generator is

	type pulse_state_type is (wait_for_0_state, wait_for_1_state, pulse_state);
	signal state, new_state	: pulse_state_type;

begin

	---------------------------------------------------------------------------------------------------------
	-- clk_proc:
	-- On rising edge of the clk signal, go to the next state
	---------------------------------------------------------------------------------------------------------
	clk_proc: process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				state <= wait_for_1_state;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	---------------------------------------------------------------------------------------------------------
	-- new_state_proc:
	-- Set the next state depending on the current state and inputs
	---------------------------------------------------------------------------------------------------------
	new_state_proc: process(state, input_signal)
	begin
		case state is
			when wait_for_1_state =>
				if input_signal = '1' then
					new_state <= pulse_state;
				else
					new_state <= state;
				end if;
				pulse <= '0';
			when pulse_state =>
				new_state <= wait_for_0_state;
				pulse <= '1';
			when wait_for_0_state =>
				if input_signal = '0' then
					new_state <= wait_for_1_state;
				else
					new_state <= wait_for_0_state;
				end if;
				pulse <= '0';
		end case;
	end process;

end architecture behavioural;