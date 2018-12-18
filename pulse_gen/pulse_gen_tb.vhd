library IEEE;
use IEEE.std_logic_1164.all;


entity pulse_generator_tb is
end entity pulse_generator_tb;


architecture structural of pulse_generator_tb is

	component pulse_generator is
		port (
			clk		: in std_logic;
			reset		: in std_logic;

			input_signal	: in std_logic;
			pulse		: out std_logic
		);
	end component pulse_generator;

	signal clk, reset, input_signal, pulse : std_logic;

begin

	PG1: pulse_generator port map (
					clk		=> clk,
					reset		=> reset,
					input_signal	=> input_signal,
					pulse		=> pulse
				);

	clk <=	'0' after 0 ns,
		'1' after 10 ns when clk /= '1' else '0' after 10 ns;

	reset <= '1' after 0 ns, '0' after 50 ns;

	input_signal <=	'0' after 0 ns,
			'1' after 30 ns,
			'0' after 80 ns,
			'1' after 150 ns;

end architecture structural;