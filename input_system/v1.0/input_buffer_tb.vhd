library IEEE;
use IEEE.std_logic_1164.all;


entity input_buffer_tb is
end entity input_buffer_tb;


architecture structural of input_buffer_tb is

	component input_buffer is
		port (
			clk		: in std_logic;
			reset		: in std_logic;

			data_in		: in std_logic_vector(3 downto 0);
			data_out	: out std_logic_vector(3 downto 0)
		);
	end component input_buffer;

	signal clk, reset		: std_logic;
	signal data_in, data_out	: std_logic_vector(3 downto 0);

begin

	IB1: input_buffer port map (
					clk		=> clk,
					reset		=> reset,
					data_in		=> data_in,
					data_out	=> data_out
				);

	clk <=	'0' after 0 ns,
		'1' after 5 ns when clk /= '1' else '0' after 5 ns;

	reset <= '1' after 0 ns, '0' after 20 ns;

	data_in <=	"0000" after 0 ns,
			"0001" after 10 ns,
			"0010" after 20 ns,
			"0011" after 30 ns,
			"0100" after 40 ns,
			"1000" after 50 ns,
			"1001" after 60 ns,
			"1010" after 70 ns,
			"1011" after 80 ns,
			"1100" after 90 ns,
			"1101" after 100 ns,
			"1110" after 110 ns,
			"1111" after 120 ns;

end architecture structural;